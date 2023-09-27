//
//  CheckButton.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct CheckButton: View {
  @ObservedObject var selection: Selection
  var onCheck: () -> Void
  var onReset: () -> Void
  var correctAnswer: HandStrength

  @State private var buttonState = CheckButtonState.default

  var body: some View {
    Button(
      action: {
        if selection.currentSelection == nil {
          return
        }

        if buttonState == .default {
          check()
        } else {
          reset()
        }
      },
      label: {
        Text(buttonState.text)
      }
    )
    .buttonStyle(
      CommonButtonStyle(
        buttonState: buttonState,
        buttonHeight: 35,
        normalOffset: 40,
        pressedOffset: 43
      )
    )
    .disabled(selection.currentSelection == nil)
    .sensoryFeedback(.success, trigger: buttonState == .correct)
  }

  private func check() {
    onCheck()
    if selection.finalSelection == correctAnswer {
      buttonState = .correct
    } else {
      buttonState = .incorrect
    }
  }

  private func reset() {
    onReset()
    buttonState = .default
  }
}

// MARK: - CheckButtonState

private enum CheckButtonState: ButtonState {
  case `default`
  case correct
  case incorrect

  var text: String {
    switch self {
    case .default: return "Check"
    case .correct: return "Continue"
    case .incorrect: return "Got it"
    }
  }

  var textColor: Color {
    switch self {
    case .default, .incorrect: return .black
    case .correct: return .white
    }
  }

  var buttonColor: Color {
    switch self {
    case .default, .correct: return .gb_bright_green
    case .incorrect: return .gb_bright_red
    }
  }

  var buttonShadowColor: Color {
    switch self {
    case .default, .correct: return .gb_faded_green
    case .incorrect: return .gb_faded_red
    }
  }
}

// MARK: - Preview

#Preview {
  DuolingoButtonWrapper()
}

private struct DuolingoButtonWrapper: View {
  @StateObject private var selection = Selection()

  var body: some View {
    ZStack {
      Color.gb_dark0_hard
      VStack(spacing: 50) {
        Button(
          action: {
            selection.currentSelection = .high
            selection.makeFinalSelection()
          },
          label: {
            Text("TAP TO ENABLE BUTTONS")
              .fontWeight(.bold)
          }
        )
        .buttonStyle(.borderedProminent)

        CheckButton(
          selection: selection, onCheck: {}, onReset: {},
          correctAnswer: .flush)
        CheckButton(
          selection: selection, onCheck: {}, onReset: {}, correctAnswer: .high
        )
      }
    }
  }
}
