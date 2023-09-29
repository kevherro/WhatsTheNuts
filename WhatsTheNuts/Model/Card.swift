//
//  Card.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct Card: Comparable, Identifiable {
  let id: UUID = UUID()
  let rank: Rank
  let suit: Suit
  let image: Image

  static func < (lhs: Card, rhs: Card) -> Bool {
    return lhs.rank < rhs.rank
  }
}
