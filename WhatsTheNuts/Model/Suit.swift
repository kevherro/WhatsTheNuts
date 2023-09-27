//
//  Suit.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

enum Suit:
  Int, CaseIterable
{
  case clubs = 0
  case diamonds
  case hearts
  case spades

  var iconName: String {
    switch self {
    case .clubs:
      return "suit.club.fill"
    case .diamonds:
      return "suit.diamond.fill"
    case .hearts:
      return "suit.heart.fill"
    case .spades:
      return "suit.spade.fill"
    }
  }
}
