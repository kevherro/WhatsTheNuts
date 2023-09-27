//
//  NutsController.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import Algorithms
import Dispatch

typealias HandResult = (strength: HandStrength, cards: [Card])

struct NutsController {
  private let deck: [Card]
  let communityCards: [Card]
  lazy var strongestHandResult: HandResult = self.nuts()

  init(round: RoundController? = nil) {
    let round = round ?? RoundController()
    deck = round.deck
    communityCards = round.communityCards
    _ = strongestHandResult
  }
}

extension NutsController {
  private func nuts() -> HandResult {
    let communityStrength = evaluate(communityCards)
    let filteredDeck: [Card] = deck.filter { !communityCards.contains($0) }

    var strongestHandResult: HandResult = (communityStrength.strength, communityCards)

    // Instead of evaluating every combination,
    // we can optimize by considering possible hands that can beat the community hand,
    // and checking if the required cards are present in the deck.
    for combo in filteredDeck.combinations(ofCount: 2) {
      var cards = communityCards
      cards.append(contentsOf: combo)
      let strength = evaluate(cards)
      if strength.strength > strongestHandResult.strength {
        strongestHandResult = strength
      }
    }

    return strongestHandResult
  }

  private func evaluate(_ cards: [Card]) -> HandResult {
    let bitmask = cards.reduce(0) { $0 | cardToBitmask($1) }

    if let cards = isRoyalFlush(bitmask: bitmask, cards: cards) { return (.royalFlush, cards) }
    if let cards = isStraightFlush(bitmask: bitmask, cards: cards) {
      return (.straightFlush, cards)
    }
    if let cards = isFourOfAKind(bitmask: bitmask, cards: cards) { return (.fourOfAKind, cards) }
    if let cards = isFullHouse(bitmask: bitmask, cards: cards) { return (.fullHouse, cards) }
    if let cards = isFlush(bitmask: bitmask, cards: cards) { return (.flush, cards) }
    if let cards = isStraight(bitmask: bitmask, cards: cards) { return (.straight, cards) }
    if let cards = isThreeOfAKind(bitmask: bitmask, cards: cards) { return (.threeOfAKind, cards) }
    if let cards = isTwoPair(bitmask: bitmask, cards: cards) { return (.twoPair, cards) }
    if let cards = isOnePair(bitmask: bitmask, cards: cards) { return (.onePair, cards) }

    return (.high, cards)
  }

  fileprivate func cardToBitmask(_ card: Card) -> UInt64 {
    return 1 << (card.rank.rawValue + (card.suit.rawValue * 13))
  }

  fileprivate func isRoyalFlush(bitmask: UInt64, cards: [Card]) -> [Card]? {
    let clubsRoyalFlush: UInt64 = (1 << 12) | (1 << 11) | (1 << 10) | (1 << 9) | (1 << 8)
    let diamondsRoyalFlush: UInt64 = clubsRoyalFlush << (13 * 1)
    let heartsRoyalFlush: UInt64 = clubsRoyalFlush << (13 * 2)
    let spadesRoyalFlush: UInt64 = clubsRoyalFlush << (13 * 3)

    let royalRanks = [12, 11, 10, 9, 8]

    if bitmask & clubsRoyalFlush == clubsRoyalFlush {
      return cards.filter { royalRanks.contains($0.rank.rawValue) && $0.suit == .clubs }
    } else if bitmask & diamondsRoyalFlush == diamondsRoyalFlush {
      return cards.filter { royalRanks.contains($0.rank.rawValue) && $0.suit == .diamonds }
    } else if bitmask & heartsRoyalFlush == heartsRoyalFlush {
      return cards.filter { royalRanks.contains($0.rank.rawValue) && $0.suit == .hearts }
    } else if bitmask & spadesRoyalFlush == spadesRoyalFlush {
      return cards.filter { royalRanks.contains($0.rank.rawValue) && $0.suit == .spades }
    }

    return nil
  }

  fileprivate func isStraightFlush(bitmask: UInt64, cards: [Card]) -> [Card]? {
    for i in 0..<4 {
      var straightFlushMask: UInt64 = (1 << 0) | (1 << 1) | (1 << 2) | (1 << 3) | (1 << 4)
      for j in 0...8 {
        let currentMask = straightFlushMask << (13 * i)
        if bitmask & currentMask == currentMask {
          // Extract the cards that make up the straight flush
          var straightFlushCards: [Card] = []
          for k in j...(j + 4) {
            let rank = k % 13  // Convert to 0-12 rank index
            let suit = Suit(rawValue: i)  // Assuming Suit is an enum 0 = clubs, 1 = diamonds, etc.
            if let card = cards.first(where: { $0.rank.rawValue == rank && $0.suit == suit }) {
              straightFlushCards.append(card)
            }
          }
          return straightFlushCards
        }
        straightFlushMask <<= 1
      }
    }
    return nil
  }

  fileprivate func isFourOfAKind(bitmask: UInt64, cards: [Card]) -> [Card]? {
    for i in 0..<13 {
      let mask: UInt64 = 1 << i
      let count = [mask, mask << 13, mask << 26, mask << 39]
        .reduce(0) { $0 + (bitmask & $1 != 0 ? 1 : 0) }

      if count == 4 {
        let fourCards = cards.filter { $0.rank.rawValue == i }
        let additionalCard = cards.first { $0.rank.rawValue != i }!
        return fourCards + [additionalCard]
      }
    }
    return nil
  }

  fileprivate func isFullHouse(bitmask: UInt64, cards: [Card]) -> [Card]? {
    var threeOfAKindRank: Int? = nil
    var threeOfAKindCards: [Card] = []

    for i in 0..<13 {
      let mask: UInt64 = 1 << i
      let count = [mask, mask << 13, mask << 26, mask << 39]
        .reduce(0) { $0 + (bitmask & $1 != 0 ? 1 : 0) }

      if count == 3 {
        threeOfAKindRank = i
        for j in 0..<4 {
          if bitmask & (mask << (j * 13)) != 0 {
            if let card = cards.first(where: { $0.rank.rawValue == i && $0.suit.rawValue == j }) {
              threeOfAKindCards.append(card)
            }
          }
        }
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
          var pairCards: [Card] = []
          for j in 0..<4 {
            if bitmask & (mask << (j * 13)) != 0 {
              if let card = cards.first(where: { $0.rank.rawValue == i && $0.suit.rawValue == j }) {
                pairCards.append(card)
              }
            }
          }
          return threeOfAKindCards + pairCards
        }
      }
    }

    return nil
  }

  fileprivate func isFlush(bitmask: UInt64, cards: [Card]) -> [Card]? {
    for i in 0..<4 {
      let suitMask: UInt64 = 0x1FFF << (13 * i)
      let count = (bitmask & suitMask).nonzeroBitCount
      if count >= 5 {
        var flushCards: [Card] = []
        for j in 0..<13 {
          if bitmask & (1 << (j + 13 * i)) != 0 {
            if let card = cards.first(where: { $0.rank.rawValue == j && $0.suit.rawValue == i }) {
              flushCards.append(card)
            }
          }
        }
        return flushCards.sorted(by: { $0.rank.rawValue > $1.rank.rawValue }).prefix(5).map { $0 }
      }
    }
    return nil
  }

  fileprivate func isStraight(bitmask: UInt64, cards: [Card]) -> [Card]? {
    // Generate a mask that only represents ranks without considering suits
    let rankMask: UInt64 = bitmask | (bitmask >> 13) | (bitmask >> 26) | (bitmask >> 39)

    // Represents the 5-card sequence A2345
    var straightMask: UInt64 = (1 << 0) | (1 << 1) | (1 << 2) | (1 << 3) | (1 << 4)

    // Check for the 9 regular straights (A2345 up to 9-T-J-Q-K)
    for _ in 0...8 {
      if (rankMask & straightMask) == straightMask {
        let straightCards = cards.filter { card in
          let mask = UInt64(1) << card.rank.rawValue
          return (mask & straightMask) != 0
        }
        if straightCards.count == 5 {
          return straightCards
        }
      }
      straightMask <<= 1
    }

    // Check for the 10-J-Q-K-A straight
    let highStraightMask: UInt64 = (1 << 9) | (1 << 10) | (1 << 11) | (1 << 12) | (1 << 0)
    if (rankMask & highStraightMask) == highStraightMask {
      let highStraightCards = cards.filter { card in
        let mask = UInt64(1) << card.rank.rawValue
        return (mask & highStraightMask) != 0
      }
      if highStraightCards.count == 5 {
        return highStraightCards
      }
    }

    return nil
  }

  fileprivate func isThreeOfAKind(bitmask: UInt64, cards: [Card]) -> [Card]? {
    for i in 0..<13 {
      let mask: UInt64 = 1 << i
      let count = [mask, mask << 13, mask << 26, mask << 39]
        .reduce(0) { $0 + (bitmask & $1 != 0 ? 1 : 0) }

      if count == 3 {
        let threeCards = cards.filter { $0.rank.rawValue == i }
        let additionalCards = cards.filter { $0.rank.rawValue != i }.sorted(by: {
          $0.rank.rawValue > $1.rank.rawValue
        }).prefix(2)
        return threeCards + additionalCards
      }
    }
    return nil
  }

  fileprivate func isTwoPair(bitmask: UInt64, cards: [Card]) -> [Card]? {
    var pairsFound = 0
    var pairRanks: [Int] = []

    for i in 0..<13 {
      let mask: UInt64 = 1 << i
      let count = [mask, mask << 13, mask << 26, mask << 39]
        .reduce(0) { $0 + (bitmask & $1 != 0 ? 1 : 0) }

      if count == 2 {
        pairsFound += 1
        pairRanks.append(i)
      }

      if pairsFound == 2 {
        let firstPairCards = cards.filter { $0.rank.rawValue == pairRanks[0] }
        let secondPairCards = cards.filter { $0.rank.rawValue == pairRanks[1] }
        let additionalCard = cards.filter {
          $0.rank.rawValue != pairRanks[0] && $0.rank.rawValue != pairRanks[1]
        }
        .sorted(by: { $0.rank.rawValue > $1.rank.rawValue }).first!
        return firstPairCards + secondPairCards + [additionalCard]
      }
    }

    return nil
  }

  fileprivate func isOnePair(bitmask: UInt64, cards: [Card]) -> [Card]? {
    for i in 0..<13 {
      let mask: UInt64 = 1 << i
      let count = [mask, mask << 13, mask << 26, mask << 39]
        .reduce(0) { $0 + (bitmask & $1 != 0 ? 1 : 0) }

      if count == 2 {
        let pairCards = cards.filter { $0.rank.rawValue == i }
        let additionalCards = cards.filter { $0.rank.rawValue != i }
          .sorted(by: { $0.rank.rawValue > $1.rank.rawValue })
          .prefix(3)
        return pairCards + additionalCards
      }
    }
    return nil
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
