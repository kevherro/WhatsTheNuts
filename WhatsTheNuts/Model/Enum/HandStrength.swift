//
//  HandStrength.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

enum HandStrength:
  Int, CustomStringConvertible, Comparable, CaseIterable
{
  case twoPair = 0
  case threeOfAKind, straight, flush, fullHouse, fourOfAKind, straightFlush, royalFlush

  var description: String {
    switch self {
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

  static func < (lhs: HandStrength, rhs: HandStrength) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }
}
