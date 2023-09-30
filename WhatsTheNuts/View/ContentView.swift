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
      Color.gb_dark0_hard.ignoresSafeArea()

      VStack {
        CommunityCardsView(communityCards: nutsController.communityCards)
          .offset(y: 20)
          .padding(.bottom, 10)

        SelectionGridView(selection: selection)
          .offset(y: -20)

        Spacer()
      }

      if showSlidingView {
        FeedbackView(
          selection: selection,
          strongestHandResult: nutsController.strongestHandResult
        )
        .transition(.move(edge: .bottom))
      }

      CheckButton(
        selection: selection,
        strongestHandResult: nutsController.strongestHandResult,
        onCheck: {
          selection.makeFinalSelection()
          toggleSlidingView()
        },
        onReset: {
          toggleSlidingView()
          selection.resetSelection()
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
      self._nutsController.wrappedValue = NutsController()
    }
  }
}

// MARK: - Preview

#Preview {
  ContentView()
}
