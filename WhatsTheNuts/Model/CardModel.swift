//
//  Card.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct CardModel:
  Identifiable, Comparable
{
  let id: UUID = UUID()
  let rank: Rank
  let suit: Suit
  let image: Image

  static func < (lhs: CardModel, rhs: CardModel) -> Bool {
    return lhs.rank < rhs.rank
  }
}
