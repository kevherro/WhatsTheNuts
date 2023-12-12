//
//  CommunityCardsView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct CommunityCardsView: View {
  @ObservedObject var nutsViewModel: NutsViewModel

  private var communityCards: [CardModel] {
    return nutsViewModel.communityCards
  }

  var body: some View {
    VStack {
      HStack {
        CardView(
          card: communityCards[0]
        )
        CardView(
          card: communityCards[1]
        )
        CardView(
          card: communityCards[2]
        )
      }
      HStack {
        CardView(
          card: communityCards[3]
        )
        CardView(
          card: communityCards[4]
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
  @StateObject private var nutsViewModel = NutsViewModel()

  var body: some View {
    ZStack {
      Color.gb_dark0
      CommunityCardsView(nutsViewModel: nutsViewModel)
    }
  }
}
