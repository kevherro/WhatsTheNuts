//
//  Suit.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

enum Suit:
  Int, CaseIterable
{
  case club = 0
  case diamond
  case heart
  case spade

  var iconName: String {
    switch self {
    case .club:
      return "suit.club.fill"
    case .diamond:
      return "suit.diamond.fill"
    case .heart:
      return "suit.heart.fill"
    case .spade:
      return "suit.spade.fill"
    }
  }
}
