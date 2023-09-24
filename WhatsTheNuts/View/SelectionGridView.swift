//
//  SelectionGridView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct SelectionGridView: View {
  @ObservedObject var selection: Selection

  private let columns: [GridItem] = Array(
    repeating: .init(.flexible()),
    count: 2
  )

  var body: some View {
    LazyVGrid(columns: columns) {
      ForEach(HandRank.allCases, id: \.self) { option in
        Button(
          action: {
            // Reset the last selected option to false.
            if let lastOption = selection.currentSelection {
              selection.pressedStates[lastOption] = false
            }
            // Set the selected option to true.
            selection.pressedStates[option] = true
            // Update the last selected option.
            selection.currentSelection = option
          },
          label: {
            Text(option.description)
          }
        )
        .buttonStyle(
          CommonButtonStyle(
            buttonState: SelectionButtonState(
              text: option.description,
              isSelected: selection.currentSelection == option
            )
          )
        )
        .padding(.bottom, -30)
        .disabled(selection.finalSelection != nil)
      }
    }
    .padding()
  }
}

// MARK: - SelectionButtonState

private enum SelectionButtonState: ButtonState {
  case `default`
  case selected

  init(text: String, isSelected: Bool) {
    if isSelected {
      self = .selected
    } else {
      self = .default
    }
  }

  var textColor: Color {
    switch self {
    case .default: return .grey
    case .selected: return .text
    }
  }

  var buttonColor: Color {
    return .darkHard
  }

  var buttonShadowColor: Color {
    switch self {
    case .default: return .gray
    case .selected: return .text
    }
  }
}

// MARK: - Preview

#Preview {
  SelectionViewWrapper()
}

private struct SelectionViewWrapper: View {
  @StateObject private var selection = Selection()

  var body: some View {
    ZStack {
      Color.darkHard
      SelectionGridView(selection: selection)
    }
  }
}
