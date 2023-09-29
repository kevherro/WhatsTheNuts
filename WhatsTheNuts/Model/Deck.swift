//
//  Deck.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/29/23.
//

import SwiftUI

public struct Deck {
  let allCards: [Card] = [
    Card(rank: .ace, suit: .hearts, image: Image("ah")),
    Card(rank: .ace, suit: .diamonds, image: Image("ad")),
    Card(rank: .ace, suit: .spades, image: Image("as")),
    Card(rank: .ace, suit: .clubs, image: Image("ac")),

    Card(rank: .two, suit: .hearts, image: Image("2h")),
    Card(rank: .two, suit: .diamonds, image: Image("2d")),
    Card(rank: .two, suit: .spades, image: Image("2s")),
    Card(rank: .two, suit: .clubs, image: Image("2c")),

    Card(rank: .three, suit: .hearts, image: Image("3h")),
    Card(rank: .three, suit: .diamonds, image: Image("3d")),
    Card(rank: .three, suit: .spades, image: Image("3s")),
    Card(rank: .three, suit: .clubs, image: Image("3c")),

    Card(rank: .four, suit: .hearts, image: Image("4h")),
    Card(rank: .four, suit: .diamonds, image: Image("4d")),
    Card(rank: .four, suit: .spades, image: Image("4s")),
    Card(rank: .four, suit: .clubs, image: Image("4c")),

    Card(rank: .five, suit: .hearts, image: Image("5h")),
    Card(rank: .five, suit: .diamonds, image: Image("5d")),
    Card(rank: .five, suit: .spades, image: Image("5s")),
    Card(rank: .five, suit: .clubs, image: Image("5c")),

    Card(rank: .six, suit: .hearts, image: Image("6h")),
    Card(rank: .six, suit: .diamonds, image: Image("6d")),
    Card(rank: .six, suit: .spades, image: Image("6s")),
    Card(rank: .six, suit: .clubs, image: Image("6c")),

    Card(rank: .seven, suit: .hearts, image: Image("7h")),
    Card(rank: .seven, suit: .diamonds, image: Image("7d")),
    Card(rank: .seven, suit: .spades, image: Image("7s")),
    Card(rank: .seven, suit: .clubs, image: Image("7c")),

    Card(rank: .eight, suit: .hearts, image: Image("8h")),
    Card(rank: .eight, suit: .diamonds, image: Image("8d")),
    Card(rank: .eight, suit: .spades, image: Image("8s")),
    Card(rank: .eight, suit: .clubs, image: Image("8c")),

    Card(rank: .nine, suit: .hearts, image: Image("9h")),
    Card(rank: .nine, suit: .diamonds, image: Image("9d")),
    Card(rank: .nine, suit: .spades, image: Image("9s")),
    Card(rank: .nine, suit: .clubs, image: Image("9c")),

    Card(rank: .ten, suit: .hearts, image: Image("10h")),
    Card(rank: .ten, suit: .diamonds, image: Image("10d")),
    Card(rank: .ten, suit: .spades, image: Image("10s")),
    Card(rank: .ten, suit: .clubs, image: Image("10c")),

    Card(rank: .jack, suit: .hearts, image: Image("jh")),
    Card(rank: .jack, suit: .diamonds, image: Image("jd")),
    Card(rank: .jack, suit: .spades, image: Image("js")),
    Card(rank: .jack, suit: .clubs, image: Image("jc")),

    Card(rank: .queen, suit: .hearts, image: Image("qh")),
    Card(rank: .queen, suit: .diamonds, image: Image("qd")),
    Card(rank: .queen, suit: .spades, image: Image("qs")),
    Card(rank: .queen, suit: .clubs, image: Image("qc")),

    Card(rank: .king, suit: .hearts, image: Image("kh")),
    Card(rank: .king, suit: .diamonds, image: Image("kd")),
    Card(rank: .king, suit: .spades, image: Image("ks")),
    Card(rank: .king, suit: .clubs, image: Image("kc")),
  ]
}
