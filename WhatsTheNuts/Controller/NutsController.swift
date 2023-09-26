//
//  NutsController.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import Algorithms
import Dispatch

struct NutsController {
  private let deck: [Card]
  let communityCards: [Card]
  lazy var strongestHand: HandStrength = self.nuts()

  init(round: RoundController? = nil) {
    let round = round ?? RoundController()
    deck = round.deck
    communityCards = round.communityCards
    _ = strongestHand
  }
}

extension NutsController {
  private func nuts() -> HandStrength {
    let communityStrength = evaluate(communityCards)
    let filteredDeck: [Card] = deck.filter { !communityCards.contains($0) }

    var strongestHand: HandStrength = communityStrength

    // Instead of evaluating every combination,
    // we can optimize by considering possible hands that can beat the community hand,
    // and checking if the required cards are present in the deck.
    for combo in filteredDeck.combinations(ofCount: 2) {
      var cards = communityCards
      cards.append(contentsOf: combo)
      let strength = evaluate(cards)
      if strength > strongestHand {
        strongestHand = strength
      }
    }

    return strongestHand
  }

  private func evaluate(_ cards: [Card]) -> HandStrength {
    let bitmask = cards.reduce(0) { $0 | cardToBitmask($1) }

    if isRoyalFlush(bitmask: bitmask) { return .royalFlush }
    if isStraightFlush(bitmask: bitmask) { return .straightFlush }
    if isFourOfAKind(bitmask: bitmask) { return .fourOfAKind }
    if isFullHouse(bitmask: bitmask) { return .fullHouse }
    if isFlush(bitmask: bitmask) { return .flush }
    if isStraight(bitmask: bitmask) { return .straight }
    if isThreeOfAKind(bitmask: bitmask) { return .threeOfAKind }
    if isTwoPair(bitmask: bitmask) { return .twoPair }
    if isOnePair(bitmask: bitmask) { return .onePair }
    return .high
  }

  fileprivate func cardToBitmask(_ card: Card) -> UInt64 {
    return 1 << (card.rank.rawValue + (card.suit.rawValue * 13))
  }

  fileprivate func isRoyalFlush(bitmask: UInt64) -> Bool {
    let clubsRoyalFlush: UInt64 = (1 << 12) | (1 << 11) | (1 << 10) | (1 << 9) | (1 << 8)
    let diamondsRoyalFlush: UInt64 = clubsRoyalFlush << (13 * 1)
    let heartsRoyalFlush: UInt64 = clubsRoyalFlush << (13 * 2)
    let spadesRoyalFlush: UInt64 = clubsRoyalFlush << (13 * 3)

    return (bitmask & clubsRoyalFlush == clubsRoyalFlush)
      || (bitmask & diamondsRoyalFlush == diamondsRoyalFlush)
      || (bitmask & heartsRoyalFlush == heartsRoyalFlush)
      || (bitmask & spadesRoyalFlush == spadesRoyalFlush)
  }

  fileprivate func isStraightFlush(bitmask: UInt64) -> Bool {
    for i in 0..<4 {
      var straightFlushMask: UInt64 = (1 << 0) | (1 << 1) | (1 << 2) | (1 << 3) | (1 << 4)
      for _ in 0...8 {
        let currentMask = straightFlushMask << (13 * i)
        if bitmask & currentMask == currentMask {
          return true
        }
        straightFlushMask <<= 1
      }
    }
    return false
  }

  fileprivate func isFourOfAKind(bitmask: UInt64) -> Bool {
    for i in 0..<13 {
      let mask: UInt64 = 1 << i
      let count = [mask, mask << 13, mask << 26, mask << 39]
        .reduce(0) { $0 + (bitmask & $1 != 0 ? 1 : 0) }

      if count == 4 {
        return true
      }
    }
    return false
  }

  fileprivate func isFullHouse(bitmask: UInt64) -> Bool {
    var threeOfAKindRank: Int? = nil
    for i in 0..<13 {
      let mask: UInt64 = 1 << i
      let count = [mask, mask << 13, mask << 26, mask << 39]
        .reduce(0) { $0 + (bitmask & $1 != 0 ? 1 : 0) }

      if count == 3 {
        threeOfAKindRank = i
        break
      }
    }

    if let threeRank = threeOfAKindRank {
      for i in 0..<13 {
        if i == threeRank { continue }  // Skip the rank we've found for three-of-a-kind

        let mask: UInt64 = 1 << i
        let count = [mask, mask << 13, mask << 26, mask << 39]
          .reduce(0) { $0 + (bitmask & $1 != 0 ? 1 : 0) }

        if count == 2 {
          return true
        }
      }
    }

    return false
  }

  fileprivate func isFlush(bitmask: UInt64) -> Bool {
    for i in 0..<4 {
      let suitMask: UInt64 = 0x1FFF << (13 * i)
      let count = (bitmask & suitMask).nonzeroBitCount
      if count >= 5 {
        return true
      }
    }
    return false
  }

  fileprivate func isStraight(bitmask: UInt64) -> Bool {
    // Generate a mask that only represents ranks without considering suits
    let rankMask: UInt64 = bitmask | (bitmask >> 13) | (bitmask >> 26) | (bitmask >> 39)

    // Represents the 5-card sequence A2345
    var straightMask: UInt64 = (1 << 0) | (1 << 1) | (1 << 2) | (1 << 3) | (1 << 4)

    // Check for the 9 regular straights (A2345 up to 9-T-J-Q-K)
    for _ in 0...8 {
      if (rankMask & straightMask) == straightMask {
        return true
      }
      straightMask <<= 1
    }

    // Check for the 10-J-Q-K-A straight
    let highStraightMask: UInt64 = (1 << 9) | (1 << 10) | (1 << 11) | (1 << 12) | (1 << 0)
    if (rankMask & highStraightMask) == highStraightMask {
      return true
    }

    return false
  }

  fileprivate func isThreeOfAKind(bitmask: UInt64) -> Bool {
    for i in 0..<13 {
      let mask: UInt64 = 1 << i
      let count = [mask, mask << 13, mask << 26, mask << 39]
        .reduce(0) { $0 + (bitmask & $1 != 0 ? 1 : 0) }

      if count == 3 {
        return true
      }
    }
    return false
  }

  fileprivate func isTwoPair(bitmask: UInt64) -> Bool {
    var pairsFound = 0

    for i in 0..<13 {
      let mask: UInt64 = 1 << i
      let count = [mask, mask << 13, mask << 26, mask << 39]
        .reduce(0) { $0 + (bitmask & $1 != 0 ? 1 : 0) }

      if count == 2 {
        pairsFound += 1
      }

      if pairsFound == 2 {
        return true
      }
    }

    return false
  }

  fileprivate func isOnePair(bitmask: UInt64) -> Bool {
    for i in 0..<13 {
      let mask: UInt64 = 1 << i
      let count = [mask, mask << 13, mask << 26, mask << 39]
        .reduce(0) { $0 + (bitmask & $1 != 0 ? 1 : 0) }

      if count == 2 {
        return true
      }
    }
    return false
  }
}

// MARK: - RoundController

struct RoundController {
  let deck: [Card]
  let communityCards: [Card]

  init(communityCards: [Card]? = nil) {
    deck = product(Suit.allCases, Rank.allCases)
      .map { Card(rank: $0.1, suit: $0.0) }
      .shuffled()

    if let providedCommunityCards = communityCards, providedCommunityCards.count <= 5 {
      self.communityCards = providedCommunityCards
    } else {
      self.communityCards = Array(deck.prefix(5))
    }
  }
}
