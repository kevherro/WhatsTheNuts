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
      Card(rank: .ten, suit: .clubs),
      Card(rank: .jack, suit: .clubs),
      Card(rank: .queen, suit: .clubs),
      Card(rank: .king, suit: .clubs),
      Card(rank: .ace, suit: .clubs),
    ]

    let roundController = RoundController(communityCards: communityCards)
    var nutsController = NutsController(round: roundController)

    XCTAssertEqual(nutsController.strongestHandResult.strength, HandStrength.royalFlush)
  }

  func testFourOfAKind() {
    let communityCards = [
      Card(rank: .ten, suit: .clubs),
      Card(rank: .ten, suit: .spades),
      Card(rank: .seven, suit: .hearts),
      Card(rank: .two, suit: .clubs),
      Card(rank: .three, suit: .hearts),
    ]

    let roundController = RoundController(communityCards: communityCards)
    var nutsController = NutsController(round: roundController)

    XCTAssertEqual(nutsController.strongestHandResult.strength, HandStrength.fourOfAKind)
  }

  func testStraightFlush() {
    let communityCards = [
      Card(rank: .two, suit: .clubs),
      Card(rank: .two, suit: .spades),
      Card(rank: .five, suit: .clubs),
      Card(rank: .six, suit: .clubs),
      Card(rank: .nine, suit: .hearts),
    ]

    let roundController = RoundController(communityCards: communityCards)
    var nutsController = NutsController(round: roundController)

    XCTAssertEqual(nutsController.strongestHandResult.strength, HandStrength.straightFlush)
  }
}
