//
//  Deck.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/29/23.
//

import SwiftUI

public struct Deck {
  let allCards: [CardType: CardModel] = [
    .aceOfHearts: CardModel(rank: .ace, suit: .hearts),
    .aceOfDiamonds: CardModel(rank: .ace, suit: .diamonds),
    .aceOfSpades: CardModel(rank: .ace, suit: .spades),
    .aceOfClubs: CardModel(rank: .ace, suit: .clubs),
    .twoOfHearts: CardModel(rank: .two, suit: .hearts),
    .twoOfDiamonds: CardModel(rank: .two, suit: .diamonds),
    .twoOfSpades: CardModel(rank: .two, suit: .spades),
    .twoOfClubs: CardModel(rank: .two, suit: .clubs),
    .threeOfHearts: CardModel(rank: .three, suit: .hearts),
    .threeOfDiamonds: CardModel(rank: .three, suit: .diamonds),
    .threeOfSpades: CardModel(rank: .three, suit: .spades),
    .threeOfClubs: CardModel(rank: .three, suit: .clubs),
    .fourOfHearts: CardModel(rank: .four, suit: .hearts),
    .fourOfDiamonds: CardModel(rank: .four, suit: .diamonds),
    .fourOfSpades: CardModel(rank: .four, suit: .spades),
    .fourOfClubs: CardModel(rank: .four, suit: .clubs),
    .fiveOfHearts: CardModel(rank: .five, suit: .hearts),
    .fiveOfDiamonds: CardModel(rank: .five, suit: .diamonds),
    .fiveOfSpades: CardModel(rank: .five, suit: .spades),
    .fiveOfClubs: CardModel(rank: .five, suit: .clubs),
    .sixOfHearts: CardModel(rank: .six, suit: .hearts),
    .sixOfDiamonds: CardModel(rank: .six, suit: .diamonds),
    .sixOfSpades: CardModel(rank: .six, suit: .spades),
    .sixOfClubs: CardModel(rank: .six, suit: .clubs),
    .sevenOfHearts: CardModel(rank: .seven, suit: .hearts),
    .sevenOfDiamonds: CardModel(rank: .seven, suit: .diamonds),
    .sevenOfSpades: CardModel(rank: .seven, suit: .spades),
    .sevenOfClubs: CardModel(rank: .seven, suit: .clubs),
    .eightOfHearts: CardModel(rank: .eight, suit: .hearts),
    .eightOfDiamonds: CardModel(rank: .eight, suit: .diamonds),
    .eightOfSpades: CardModel(rank: .eight, suit: .spades),
    .eightOfClubs: CardModel(rank: .eight, suit: .clubs),
    .nineOfHearts: CardModel(rank: .nine, suit: .hearts),
    .nineOfDiamonds: CardModel(rank: .nine, suit: .diamonds),
    .nineOfSpades: CardModel(rank: .nine, suit: .spades),
    .nineOfClubs: CardModel(rank: .nine, suit: .clubs),
    .tenOfHearts: CardModel(rank: .ten, suit: .hearts),
    .tenOfDiamonds: CardModel(rank: .ten, suit: .diamonds),
    .tenOfSpades: CardModel(rank: .ten, suit: .spades),
    .tenOfClubs: CardModel(rank: .ten, suit: .clubs),
    .jackOfHearts: CardModel(rank: .jack, suit: .hearts),
    .jackOfDiamonds: CardModel(rank: .jack, suit: .diamonds),
    .jackOfSpades: CardModel(rank: .jack, suit: .spades),
    .jackOfClubs: CardModel(rank: .jack, suit: .clubs),
    .queenOfHearts: CardModel(rank: .queen, suit: .hearts),
    .queenOfDiamonds: CardModel(rank: .queen, suit: .diamonds),
    .queenOfSpades: CardModel(rank: .queen, suit: .spades),
    .queenOfClubs: CardModel(rank: .queen, suit: .clubs),
    .kingOfHearts: CardModel(rank: .king, suit: .hearts),
    .kingOfDiamonds: CardModel(rank: .king, suit: .diamonds),
    .kingOfSpades: CardModel(rank: .king, suit: .spades),
    .kingOfClubs: CardModel(rank: .king, suit: .clubs),
  ]
}
