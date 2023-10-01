//
//  ContentView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var viewModel = HandStrengthViewModel()

  @State private var communityCards: [CardModel]
  @State private var strongestHandResult: HandResult
  @State private var showSlidingView = false

  init() {
    var controller = NutsController()
    communityCards = controller.communityCards
    strongestHandResult = controller.strongestHandResult
  }

  var body: some View {
    ZStack(alignment: .bottom) {
      Color.gb_dark0_hard.ignoresSafeArea()

      VStack {
        CommunityCardsView(communityCards: communityCards)
          .offset(y: 20)
          .padding(.bottom, 10)

        HandStrengthsGridView(viewModel: viewModel)

        Spacer()
      }

      if showSlidingView {
        FeedbackView(
          viewModel: viewModel,
          strongestHandResult: strongestHandResult
        )
        .transition(.move(edge: .bottom))
      }

      CheckButtonView(
        viewModel: viewModel,
        strongestHandResult: strongestHandResult,
        onCheck: {
          viewModel.select()
          toggleSlidingView()
        },
        onReset: {
          toggleSlidingView()
          viewModel.reset()
          resetController()
        }
      )
      .padding(.bottom, 30)
    }
    .ignoresSafeArea(edges: .bottom)
  }

  private func toggleSlidingView() {
    DispatchQueue.main.async(qos: .userInteractive) {
      withAnimation(.snappy(duration: 0.1)) {
        showSlidingView.toggle()
      }
    }
  }

  private func resetController() {
    DispatchQueue.main.async {
      var controller = NutsController()
      self._communityCards.wrappedValue = controller.communityCards
      self._strongestHandResult.wrappedValue = controller.strongestHandResult
    }
  }
}

// MARK: - Preview

#Preview {
  ContentView()
}
