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
  private let deck: [CardType: CardModel] = Deck().allCards

  func testRoyalFlush() {
    let communityCards: [CardModel] = [
      deck[.tenOfClubs]!,
      deck[.jackOfClubs]!,
      deck[.queenOfClubs]!,
      deck[.kingOfClubs]!,
      deck[.aceOfClubs]!,
    ]

    let roundController = RoundController(communityCards: communityCards)
    var nutsController = NutsController(round: roundController)

    XCTAssertEqual(nutsController.strongestHandResult.strength, HandStrength.royalFlush)
  }

  func testFourOfAKind() {
    let communityCards: [CardModel] = [
      deck[.tenOfClubs]!,
      deck[.tenOfSpades]!,
      deck[.sevenOfHearts]!,
      deck[.twoOfClubs]!,
      deck[.threeOfHearts]!,
    ]

    let roundController = RoundController(communityCards: communityCards)
    var nutsController = NutsController(round: roundController)

    XCTAssertEqual(nutsController.strongestHandResult.strength, HandStrength.fourOfAKind)
  }

  func testStraightFlush() {
    let communityCards: [CardModel] = [
      deck[.twoOfClubs]!,
      deck[.twoOfSpades]!,
      deck[.fiveOfClubs]!,
      deck[.sixOfClubs]!,
      deck[.nineOfHearts]!,
    ]

    let roundController = RoundController(communityCards: communityCards)
    var nutsController = NutsController(round: roundController)

    XCTAssertEqual(nutsController.strongestHandResult.strength, HandStrength.straightFlush)
  }
}
