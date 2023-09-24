//
//  HandRank.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

enum HandRank:
  Int, CustomStringConvertible, Comparable, CaseIterable
{
  case low = 0
  case onePair
  case twoPair
  case threeOfAKind
  case straight
  case flush
  case fullHouse
  case fourOfAKind
  case straightFlush
  case royalFlush

  var description: String {
    switch self {
    case .low:
      return "Low"
    case .onePair:
      return "1 Pair"
    case .twoPair:
      return "2 Pair"
    case .threeOfAKind:
      return "3 of a Kind"
    case .straight:
      return "Straight"
    case .flush:
      return "Flush"
    case .fullHouse:
      return "Full House"
    case .fourOfAKind:
      return "Four of a Kind"
    case .straightFlush:
      return "Straight Flush"
    case .royalFlush:
      return "Royal Flush"
    }
  }

  static func < (lhs: HandRank, rhs: HandRank) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }
}
