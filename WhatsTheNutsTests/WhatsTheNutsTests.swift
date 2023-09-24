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
    let nutsController = NutsController(round: roundController)

    let (bestRank, bestHand) = nutsController.nuts()

    XCTAssertEqual(bestRank, HandRank.royalFlush)

    // Verify the cards in the best hand.
    XCTAssertEqual(bestHand.count, 5)
    XCTAssert(bestHand.contains(Card(rank: .ten, suit: .club)))
    XCTAssert(bestHand.contains(Card(rank: .jack, suit: .club)))
    XCTAssert(bestHand.contains(Card(rank: .queen, suit: .club)))
    XCTAssert(bestHand.contains(Card(rank: .king, suit: .club)))
    XCTAssert(bestHand.contains(Card(rank: .ace, suit: .club)))
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
    let nutsController = NutsController(round: roundController)

    let (bestRank, bestHand) = nutsController.nuts()

    XCTAssertEqual(bestRank, HandRank.fourOfAKind)

    // Verify the cards in the best hand.
    XCTAssertEqual(bestHand.count, 5)
    XCTAssert(bestHand.contains(Card(rank: .ten, suit: .club)))
    XCTAssert(bestHand.contains(Card(rank: .ten, suit: .diamond)))
    XCTAssert(bestHand.contains(Card(rank: .ten, suit: .heart)))
    XCTAssert(bestHand.contains(Card(rank: .ten, suit: .spade)))
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
    let nutsController = NutsController(round: roundController)

    let (bestRank, bestHand) = nutsController.nuts()

    XCTAssertEqual(bestRank, HandRank.straightFlush)

    // Verify the cards in the best hand.
    XCTAssertEqual(bestHand.count, 5)
    XCTAssert(bestHand.contains(Card(rank: .three, suit: .club)))
    XCTAssert(bestHand.contains(Card(rank: .four, suit: .club)))
  }
}
