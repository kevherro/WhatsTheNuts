//
//  WhatsTheNutsTests.swift
//  WhatsTheNutsTests
//
//  Created by Kevin Herro on 9/24/23.
//

import XCTest

@testable import WhatsTheNuts

final class WhatsTheNutsTests: XCTestCase {
  func testRoyalFlush() {
    let communityCards = [
      Card(rank: .ten, suit: .club),
      Card(rank: .jack, suit: .club),
      Card(rank: .queen, suit: .club),
      Card(rank: .king, suit: .club),
      Card(rank: .ace, suit: .club),
    ]

    let roundController = RoundController(communityCards: communityCards)
    var nutsController = NutsController(round: roundController)

    XCTAssertEqual(nutsController.strongestHand, HandStrength.royalFlush)
  }

  func testFourOfAKind() {
    let communityCards = [
      Card(rank: .ten, suit: .club),
      Card(rank: .ten, suit: .spade),
      Card(rank: .seven, suit: .heart),
      Card(rank: .two, suit: .club),
      Card(rank: .three, suit: .heart),
    ]

    let roundController = RoundController(communityCards: communityCards)
    var nutsController = NutsController(round: roundController)

    XCTAssertEqual(nutsController.strongestHand, HandStrength.fourOfAKind)
  }

  func testStraightFlush() {
    let communityCards = [
      Card(rank: .two, suit: .club),
      Card(rank: .two, suit: .spade),
      Card(rank: .five, suit: .club),
      Card(rank: .six, suit: .club),
      Card(rank: .nine, suit: .heart),
    ]

    let roundController = RoundController(communityCards: communityCards)
    var nutsController = NutsController(round: roundController)

    XCTAssertEqual(nutsController.strongestHand, HandStrength.straightFlush)
  }
}
