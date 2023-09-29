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
  ZStack {
    Color.gb_dark0
    CommunityCardsView(communityCards: Array(Constants().deck.prefix(5)))
  }
}
