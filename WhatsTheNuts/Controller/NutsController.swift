//
//  NutsController.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

typealias Hand = [Card]
typealias Nuts = (handRank: HandRank, hand: Hand)

struct NutsController {
  private let deck: [Card]
  let communityCards: [Card]

  init(round: RoundController? = nil) {
    let round = round ?? RoundController()
    deck = round.deck
    communityCards = round.communityCards
  }

  func nuts() -> Nuts {
    let filteredDeck: [Card] =
      deck
      .filter { !communityCards.contains($0) }

    var bestHand: Hand? = nil
    var bestRank: HandRank? = nil

    for combo in filteredDeck.combinations(ofCount: 2) {
      var cards = communityCards
      cards.append(contentsOf: combo)

      for handCards in cards.combinations(ofCount: 5) {
        let hand = Array(handCards)
        let rank = evaluate(hand)

        if bestRank == nil || rank > bestRank! {
          bestHand = hand
          bestRank = rank
        }
      }
    }

    return (bestRank!, bestHand!)
  }

  private func evaluate(_ cards: [Card]) -> HandRank {
    precondition(cards.count == 5, "Hand must contain five (5) cards. Got \(cards.count) instead.")

    var ranks = Array(repeating: 0, count: 13)
    var suits = Array(repeating: 0, count: 4)
    var isFlush = false
    var isStraight = false

    for card in cards {
      ranks[card.rank.rawValue - 2] += 1
      suits[card.suit.rawValue] += 1
    }

    let maxSameRank = ranks.max()!
    let maxSameSuit = suits.max()!

    if maxSameSuit == 5 {
      isFlush = true
    }

    for window in stride(from: 0, to: ranks.count - 4, by: 1) {
      if ranks[window..<window + 5].allSatisfy({ $0 == 1 }) {
        isStraight = true
        break
      }
    }

    if ranks[0] == 1 && ranks[1...4].allSatisfy({ $0 == 1 }) && ranks[12] == 1 {
      isStraight = true
    }

    let highestRankCard = cards.max { a, b in a.rank < b.rank }!

    switch (isStraight, isFlush, maxSameRank) {
    case (true, true, _) where highestRankCard.rank.rawValue == 14:
      return .royalFlush
    case (true, true, _):
      return .straightFlush
    case (_, _, 4):
      return .fourOfAKind
    case (_, _, 3) where ranks.filter({ $0 == 2 }).count > 0:
      return .fullHouse
    case (_, true, _):
      return .flush
    case (true, _, _):
      return .straight
    case (_, _, 3):
      return .threeOfAKind
    case (_, _, 2) where ranks.filter({ $0 == 2 }).count > 1:
      return .twoPair
    case (_, _, 2):
      return .onePair
    default:
      return .low
    }
  }
}

// MARK: - RoundController

struct RoundController {
  let deck: [Card]
  let communityCards: [Card]

  init(communityCards: [Card]? = nil) {
    deck = Suit.allCases.product(with: Rank.allCases)
      .map { Card(rank: $0.1, suit: $0.0) }
      .shuffled()

    self.communityCards = communityCards ?? Array(deck.prefix(5))
  }
}
