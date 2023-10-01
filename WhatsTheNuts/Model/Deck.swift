//
//  Deck.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/29/23.
//

import SwiftUI

public struct Deck {
  let allCards: [CardType: CardModel] = [
    .aceOfHearts: CardModel(rank: .ace, suit: .hearts, image: Image("ah")),
    .aceOfDiamonds: CardModel(rank: .ace, suit: .diamonds, image: Image("ad")),
    .aceOfSpades: CardModel(rank: .ace, suit: .spades, image: Image("as")),
    .aceOfClubs: CardModel(rank: .ace, suit: .clubs, image: Image("ac")),
    .twoOfHearts: CardModel(rank: .two, suit: .hearts, image: Image("2h")),
    .twoOfDiamonds: CardModel(rank: .two, suit: .diamonds, image: Image("2d")),
    .twoOfSpades: CardModel(rank: .two, suit: .spades, image: Image("2s")),
    .twoOfClubs: CardModel(rank: .two, suit: .clubs, image: Image("2c")),
    .threeOfHearts: CardModel(rank: .three, suit: .hearts, image: Image("3h")),
    .threeOfDiamonds: CardModel(rank: .three, suit: .diamonds, image: Image("3d")),
    .threeOfSpades: CardModel(rank: .three, suit: .spades, image: Image("3s")),
    .threeOfClubs: CardModel(rank: .three, suit: .clubs, image: Image("3c")),
    .fourOfHearts: CardModel(rank: .four, suit: .hearts, image: Image("4h")),
    .fourOfDiamonds: CardModel(rank: .four, suit: .diamonds, image: Image("4d")),
    .fourOfSpades: CardModel(rank: .four, suit: .spades, image: Image("4s")),
    .fourOfClubs: CardModel(rank: .four, suit: .clubs, image: Image("4c")),
    .fiveOfHearts: CardModel(rank: .five, suit: .hearts, image: Image("5h")),
    .fiveOfDiamonds: CardModel(rank: .five, suit: .diamonds, image: Image("5d")),
    .fiveOfSpades: CardModel(rank: .five, suit: .spades, image: Image("5s")),
    .fiveOfClubs: CardModel(rank: .five, suit: .clubs, image: Image("5c")),
    .sixOfHearts: CardModel(rank: .six, suit: .hearts, image: Image("6h")),
    .sixOfDiamonds: CardModel(rank: .six, suit: .diamonds, image: Image("6d")),
    .sixOfSpades: CardModel(rank: .six, suit: .spades, image: Image("6s")),
    .sixOfClubs: CardModel(rank: .six, suit: .clubs, image: Image("6c")),
    .sevenOfHearts: CardModel(rank: .seven, suit: .hearts, image: Image("7h")),
    .sevenOfDiamonds: CardModel(rank: .seven, suit: .diamonds, image: Image("7d")),
    .sevenOfSpades: CardModel(rank: .seven, suit: .spades, image: Image("7s")),
    .sevenOfClubs: CardModel(rank: .seven, suit: .clubs, image: Image("7c")),
    .eightOfHearts: CardModel(rank: .eight, suit: .hearts, image: Image("8h")),
    .eightOfDiamonds: CardModel(rank: .eight, suit: .diamonds, image: Image("8d")),
    .eightOfSpades: CardModel(rank: .eight, suit: .spades, image: Image("8s")),
    .eightOfClubs: CardModel(rank: .eight, suit: .clubs, image: Image("8c")),
    .nineOfHearts: CardModel(rank: .nine, suit: .hearts, image: Image("9h")),
    .nineOfDiamonds: CardModel(rank: .nine, suit: .diamonds, image: Image("9d")),
    .nineOfSpades: CardModel(rank: .nine, suit: .spades, image: Image("9s")),
    .nineOfClubs: CardModel(rank: .nine, suit: .clubs, image: Image("9c")),
    .tenOfHearts: CardModel(rank: .ten, suit: .hearts, image: Image("10h")),
    .tenOfDiamonds: CardModel(rank: .ten, suit: .diamonds, image: Image("10d")),
    .tenOfSpades: CardModel(rank: .ten, suit: .spades, image: Image("10s")),
    .tenOfClubs: CardModel(rank: .ten, suit: .clubs, image: Image("10c")),
    .jackOfHearts: CardModel(rank: .jack, suit: .hearts, image: Image("jh")),
    .jackOfDiamonds: CardModel(rank: .jack, suit: .diamonds, image: Image("jd")),
    .jackOfSpades: CardModel(rank: .jack, suit: .spades, image: Image("js")),
    .jackOfClubs: CardModel(rank: .jack, suit: .clubs, image: Image("jc")),
    .queenOfHearts: CardModel(rank: .queen, suit: .hearts, image: Image("qh")),
    .queenOfDiamonds: CardModel(rank: .queen, suit: .diamonds, image: Image("qd")),
    .queenOfSpades: CardModel(rank: .queen, suit: .spades, image: Image("qs")),
    .queenOfClubs: CardModel(rank: .queen, suit: .clubs, image: Image("qc")),
    .kingOfHearts: CardModel(rank: .king, suit: .hearts, image: Image("kh")),
    .kingOfDiamonds: CardModel(rank: .king, suit: .diamonds, image: Image("kd")),
    .kingOfSpades: CardModel(rank: .king, suit: .spades, image: Image("ks")),
    .kingOfClubs: CardModel(rank: .king, suit: .clubs, image: Image("kc")),
  ]
}
