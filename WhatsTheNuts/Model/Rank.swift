//
//  Rank.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

enum Rank:
  Int, Comparable, CaseIterable
{
  case two = 0
  case three
  case four
  case five
  case six
  case seven
  case eight
  case nine
  case ten
  case jack
  case queen
  case king
  case ace

  static func < (lhs: Rank, rhs: Rank) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  var description: String {
    switch self {
    case .two:
      return "2"
    case .three:
      return "3"
    case .four:
      return "4"
    case .five:
      return "5"
    case .six:
      return "6"
    case .seven:
      return "7"
    case .eight:
      return "8"
    case .nine:
      return "9"
    case .ten:
      return "10"
    case .jack:
      return "J"
    case .queen:
      return "Q"
    case .king:
      return "K"
    case .ace:
      return "A"
    }
  }
}
