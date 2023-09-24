//
//  Card.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

struct Card: Comparable {
  let rank: Rank
  let suit: Suit

  static func < (lhs: Card, rhs: Card) -> Bool {
    return lhs.rank < rhs.rank
  }
}
