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
    Card(rank: .ace, suit: .clubs),
    Card(rank: .ace, suit: .spades),
    Card(rank: .ace, suit: .hearts),
    Card(rank: .ace, suit: .diamonds),
    Card(rank: .king, suit: .clubs),
  ])
}
