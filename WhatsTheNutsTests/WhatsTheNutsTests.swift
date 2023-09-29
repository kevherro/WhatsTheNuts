//
//  WhatsTheNutsTests.swift
//  WhatsTheNutsTests
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI
import XCTest

@testable import WhatsTheNuts

final class WhatsTheNutsTests: XCTestCase {
  func testRoyalFlush() {
    let communityCards = [
      Card(rank: .ten, suit: .clubs, image: Image("")),
      Card(rank: .jack, suit: .clubs, image: Image("")),
      Card(rank: .queen, suit: .clubs, image: Image("")),
      Card(rank: .king, suit: .clubs, image: Image("")),
      Card(rank: .ace, suit: .clubs, image: Image("")),
    ]

    let roundController = RoundController(communityCards: communityCards)
    var nutsController = NutsController(round: roundController)

    XCTAssertEqual(nutsController.strongestHandResult.strength, HandStrength.royalFlush)
  }

  func testFourOfAKind() {
    let communityCards = [
      Card(rank: .ten, suit: .clubs, image: Image("")),
      Card(rank: .ten, suit: .spades, image: Image("")),
      Card(rank: .seven, suit: .hearts, image: Image("")),
      Card(rank: .two, suit: .clubs, image: Image("")),
      Card(rank: .three, suit: .hearts, image: Image("")),
    ]

    let roundController = RoundController(communityCards: communityCards)
    var nutsController = NutsController(round: roundController)

    XCTAssertEqual(nutsController.strongestHandResult.strength, HandStrength.fourOfAKind)
  }

  func testStraightFlush() {
    let communityCards = [
      Card(rank: .two, suit: .clubs, image: Image("")),
      Card(rank: .two, suit: .spades, image: Image("")),
      Card(rank: .five, suit: .clubs, image: Image("")),
      Card(rank: .six, suit: .clubs, image: Image("")),
      Card(rank: .nine, suit: .hearts, image: Image("")),
    ]

    let roundController = RoundController(communityCards: communityCards)
    var nutsController = NutsController(round: roundController)

    XCTAssertEqual(nutsController.strongestHandResult.strength, HandStrength.straightFlush)
  }
}
