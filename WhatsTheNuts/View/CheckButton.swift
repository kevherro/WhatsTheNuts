//
//  CheckButton.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct CheckButton: View {
  @ObservedObject var selection: Selection
  var strongestHandResult: HandResult

  var onCheck: () -> Void
  var onReset: () -> Void

  @State private var buttonState = CheckButtonState.default
  @State private var isPressed = false
  @State private var triggerHaptics = false

  private let buttonHeight: CGFloat = 50
  private let pressedOffset: CGFloat = 58
  private let normalOffset: CGFloat = 53
  private let stickDuration: TimeInterval = 0.2
  private let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)

  var body: some View {
    ZStack {
      VStack {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .fill(buttonState.buttonColor)
          .frame(height: buttonHeight)
          .overlay(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
              .stroke(buttonState.buttonShadowColor, lineWidth: 1)
          )
          .overlay(
            Text(buttonState.text)
              .font(.title2)
              .fontDesign(.rounded)
              .foregroundStyle(buttonState.textColor)
              .fontWeight(.bold)
              .kerning(0.5)
          )
          .offset(y: isPressed ? pressedOffset : normalOffset)
          .zIndex(1)
        RoundedRectangle(cornerRadius: 12)
          .stroke(buttonState.buttonShadowColor, lineWidth: 0)
          .fill(buttonState.buttonShadowColor)
          .frame(height: buttonHeight)
      }
    }
    .padding(.horizontal)
    .disabled(selection.currentSelection == nil)
    .onTapGesture {
      if selection.currentSelection == nil {
        return
      }

      isPressed.toggle()

      DispatchQueue.main.asyncAfter(deadline: .now() + stickDuration) {
        isPressed.toggle()
        if buttonState == .default {
          check()
        } else {
          reset()
        }
      }
    }
  }

  private func check() {
    onCheck()
    if selection.finalSelection == strongestHandResult.strength {
      buttonState = .correct
      feedbackGenerator.impactOccurred()
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
    return .black
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
  CheckButtonWrapper()
}

private struct CheckButtonWrapper: View {
  @StateObject private var selection = Selection()
  var incorrect: HandResult = (.flush, [])
  var correct: HandResult = (.threeOfAKind, [])

  var body: some View {
    ZStack {
      Color.gb_dark0_hard
      VStack(spacing: 50) {
        Button(
          action: {
            selection.currentSelection = .threeOfAKind
            selection.makeFinalSelection()
          },
          label: {
            Text("TAP TO ENABLE BUTTONS")
              .fontWeight(.bold)
          }
        )
        .buttonStyle(.borderedProminent)

        CheckButton(
          selection: selection,
          strongestHandResult: incorrect,
          onCheck: {},
          onReset: {}
        )
        CheckButton(
          selection: selection,
          strongestHandResult: correct,
          onCheck: {},
          onReset: {}
        )
      }
    }
  }
}
