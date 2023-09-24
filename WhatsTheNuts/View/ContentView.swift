//
//  ContentView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct ContentView: View {
  @State private var communityCards: [Card]
  @State private var nuts: Nuts
  @State private var showSlidingView = false

  @StateObject private var selection = Selection()

  init() {
    let nutsController: NutsController = NutsController()
    self._communityCards = State(initialValue: nutsController.communityCards)
    self._nuts = State(initialValue: nutsController.nuts())
  }

  var body: some View {
    ZStack(alignment: .bottom) {
      Color.darkHard.ignoresSafeArea()

      VStack {
        CommunityCardsView(communityCards: communityCards)
          .padding(.top, 50)

        SelectionGridView(selection: selection)

        Spacer()
      }

      if showSlidingView {
        FeedbackView(
          isCorrect: nuts.handRank == selection.finalSelection,
          correctAnswer: nuts.handRank
        )
        .transition(.move(edge: .bottom))
      }

      CheckButton(
        selection: selection,
        onCheck: {
          selection.makeFinalSelection()
          toggleSlidingView()
        },
        onReset: {
          toggleSlidingView()
          selection.resetSelection()
          resetController()
        },
        correctAnswer: nuts.handRank
      )
      .padding(.bottom, 30)
    }
    .ignoresSafeArea(edges: .bottom)
  }

  private func toggleSlidingView() {
    withAnimation(.snappy(duration: 0.1)) {
      showSlidingView.toggle()
    }
  }

  private func resetController() {
    DispatchQueue.main.async {
      let nutsController: NutsController = NutsController()
      self._communityCards.wrappedValue = nutsController.communityCards
      self._nuts.wrappedValue = nutsController.nuts()
    }
  }
}

// MARK: - Preview

#Preview {
  ContentView()
}
