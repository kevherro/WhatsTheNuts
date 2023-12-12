//
//  ContentView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var handStrengthViewModel = HandStrengthViewModel()
  @StateObject private var nutsViewModel = NutsViewModel()

  private var communityCards: [CardModel] {
    return nutsViewModel.communityCards
  }

  private var expected: HandStrength {
    return nutsViewModel.nuts.strength
  }

  private var actual: HandStrength? {
    return handStrengthViewModel.handStrength
  }

  var body: some View {
    ZStack(alignment: .bottom) {
      Color.gb_dark0_hard.ignoresSafeArea()

      VStack {
        CommunityCardsView(nutsViewModel: nutsViewModel)
          .offset(y: 20)
          .padding(.bottom, 10)

        HandStrengthGridView(
          handStrengthViewModel: handStrengthViewModel,
          nutsViewModel: nutsViewModel
        )
        .offset(y: 25)

        Spacer()
      }

      CheckButtonView(
        condition: {
          expected == actual
        },
        onCheck: {
          handStrengthViewModel.lock()
        },
        onReset: {
          startNewRound()
        }
      )
      .disabled(handStrengthViewModel.selectedButton == nil)
      .padding(.bottom, 30)
    }
    .ignoresSafeArea(edges: .bottom)
  }

  private func startNewRound() {
    DispatchQueue.main.async {
      self.nutsViewModel.startNewRound()
      self.handStrengthViewModel.startNewRound()
    }
  }
}

// MARK: - Preview

#Preview {
  ContentView()
}
