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

  private var buttonHeight: CGFloat {
    return UIScreen.height / 24
  }

  var body: some View {
    LazyVGrid(columns: columns) {
      ForEach(HandStrength.allCases, id: \.self) { option in
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
        //        .buttonStyle(
        //          CommonButtonStyle(
        //            buttonState: SelectionButtonState(
        //              text: option.description,
        //              isSelected: selection.currentSelection == option
        //            ),
        //            buttonHeight: buttonHeight,
        //            normalOffset: buttonHeight + 5,
        //            pressedOffset: buttonHeight + 8
        //          )
        //        )
        .padding(.bottom, -30)
        .disabled(selection.finalSelection != nil)
      }
    }
    .padding()
  }
}

// MARK: - SelectionButtonState

private enum SelectionButtonState {
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
    case .default: return .gb_gray_245
    case .selected: return .gb_light0_hard
    }
  }

  var buttonColor: Color {
    return .gb_dark0_hard
  }

  var buttonShadowColor: Color {
    switch self {
    case .default: return .gb_gray_245
    case .selected: return .gb_light0_hard
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
      Color.gb_dark0_hard
      SelectionGridView(selection: selection)
    }
  }
}
