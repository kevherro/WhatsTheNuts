//
//  CommunityCardsView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct CommunityCardsView: View {
  var communityCards: [Card]

  private let width: CGFloat = UIScreen.width / 3.7

  var body: some View {
    VStack {
      HStack {
        CardView(
          card: communityCards[0],
          width: width
        )
        CardView(
          card: communityCards[1],
          width: width
        )
        CardView(
          card: communityCards[2],
          width: width
        )
      }
      HStack {
        CardView(
          card: communityCards[3],
          width: width
        )
        CardView(
          card: communityCards[4],
          width: width
        )
      }
    }
  }
}

// MARK: - Preview

#Preview {
  CommunityCardsViewWrapper()
}

private struct CommunityCardsViewWrapper: View {
  private let communityCards: [Card] = Array(Deck().allCards.shuffled().prefix(5))

  var body: some View {
    ZStack {
      Color.gb_dark0
      CommunityCardsView(communityCards: communityCards)
    }
  }
}
