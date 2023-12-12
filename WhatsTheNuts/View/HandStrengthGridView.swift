//
//  HandStrengthGridView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/30/23.
//

import SwiftUI

struct HandStrengthGridView: View {
  @ObservedObject var handStrengthViewModel: HandStrengthViewModel
  @ObservedObject var nutsViewModel: NutsViewModel

  @State private var buttons: [HandStrengthButtonModel] = []

  private var result: HandStrength {
    nutsViewModel.nuts.strength
  }

  var body: some View {
    let columns: [GridItem] = [GridItem(.flexible())]

    LazyVGrid(columns: columns) {
      ForEach(buttons) { button in
        GridButtonView(
          button: button,
          isSelected: handStrengthViewModel.selectedButton?.id == button.id
        ) {
          handStrengthViewModel.selectedButton = button
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        .disabled(handStrengthViewModel.finalSelection != nil)
      }
    }
    .onAppear(perform: refreshButtons)
    .onChange(of: handStrengthViewModel.shouldRefreshButtons) {
      refreshButtons()
    }
  }

  private func refreshButtons() {
    buttons =
      (Array(HandStrength.allCases.shuffled().filter { $0 != result }.prefix(3))
      + [result])
      .shuffled()
      .enumerated()
      .map { HandStrengthButtonModel(id: $0, handStrength: $1) }
    handStrengthViewModel.resetRefreshTrigger()
  }
}

#Preview {
  ZStack {
    Color.gb_dark0
    HandStrengthsViewWrapper()
  }
}

private struct HandStrengthsViewWrapper: View {
  @StateObject private var viewModel = HandStrengthViewModel()
  @StateObject private var nutsViewModel = NutsViewModel()

  var body: some View {
    ZStack {
      Color.gb_dark0_hard
      HandStrengthGridView(
        handStrengthViewModel: viewModel,
        nutsViewModel: nutsViewModel
      )
      Button(
        action: viewModel.startNewRound,
        label: {
          Text("Reset buttons")
        }
      ).buttonStyle(.borderedProminent)
        .offset(y: 200)
    }
  }
}
