//
//  ContentView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct ContentView: View {
  @State private var nutsController: NutsController
  @State private var showSlidingView = false

  @StateObject private var selection = Selection()

  init() {
    nutsController = NutsController()
  }

  var body: some View {
    ZStack(alignment: .bottom) {
      Color.darkHard.ignoresSafeArea()

      VStack {
        RelativeProgressView()
          .padding(.top, 10)

        CommunityCardsView(communityCards: nutsController.communityCards)
          .padding(.top, 30)

        SelectionGridView(selection: selection)

        Spacer()
      }

      if showSlidingView {
        FeedbackView(
          isCorrect: nutsController.strongestHand == selection.finalSelection,
          correctAnswer: nutsController.strongestHand
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
        correctAnswer: nutsController.strongestHand
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
      self._nutsController.wrappedValue = NutsController()
    }
  }
}

// MARK: - Preview

#Preview {
  ContentView()
}
