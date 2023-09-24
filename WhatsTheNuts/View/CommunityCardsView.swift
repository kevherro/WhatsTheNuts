//
//  CommunityCardsView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct CommunityCardsView: View {
  var communityCards: [Card]

  var body: some View {
    VStack {
      HStack {
        CardView(card: communityCards[0])
        CardView(card: communityCards[1])
        CardView(card: communityCards[2])
      }
      .padding(.bottom, 10)
      HStack {
        CardView(card: communityCards[3])
        CardView(card: communityCards[4])
      }
    }
  }
}

// MARK: - Preview

#Preview {
  CommunityCardsView(communityCards: [
    Card(rank: .ace, suit: .club),
    Card(rank: .ace, suit: .spade),
    Card(rank: .ace, suit: .heart),
    Card(rank: .ace, suit: .diamond),
    Card(rank: .king, suit: .club),
  ])
}
