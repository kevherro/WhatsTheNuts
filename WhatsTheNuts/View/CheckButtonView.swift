//
//  CheckButtonView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct CheckButtonView: View {
  var condition: () -> Bool
  var onCheck: () -> Void
  var onReset: () -> Void

  var width: CGFloat = 350
  var height: CGFloat = 60

  @State private var buttonState = CheckButtonState.default
  @State private var isPressed = false

  private let stickyDuration: TimeInterval = 0.08

  var body: some View {
    CheckButton(
      buttonState: buttonState,
      width: width,
      height: height,
      isPressed: isPressed
    )
    .padding(.horizontal)
    .onTapGesture {
      handleButtonAction()
    }
  }

  private func handleButtonAction() {
    isPressed.toggle()

    DispatchQueue.main.asyncAfter(
      deadline: .now() + stickyDuration,
      qos: .userInteractive
    ) {
      isPressed.toggle()

      if buttonState == .default {
        onCheck()

        if condition() {
          buttonState = .correct
          UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        } else {
          buttonState = .incorrect
        }
      } else {
        onReset()
        buttonState = .default
      }
    }
  }
}

// MARK: - CheckButton

private struct CheckButton: View {
  var buttonState: CheckButtonState
  var width: CGFloat
  var height: CGFloat
  var isPressed: Bool

  var body: some View {
    ZStack {
      RoundedRectangle(
        cornerRadius: 8,
        style: .continuous
      )
      .fill(buttonState.buttonColor)
      .frame(
        width: width,
        height: height
      )
      .overlay(
        RoundedRectangle(
          cornerRadius: 8,
          style: .continuous
        )
        .stroke(
          buttonState.buttonShadowColor,
          lineWidth: 1
        )
      )
      .overlay(
        Text(buttonState.text)
          .font(.title2)
          .fontDesign(.rounded)
          .foregroundStyle(buttonState.textColor)
          .fontWeight(.bold)
          .kerning(0.5)
      )
      .offset(y: isPressed ? 0 : -2.8)
      .zIndex(1)
      RoundedRectangle(cornerRadius: 11)
        .stroke(buttonState.buttonShadowColor)
        .fill(buttonState.buttonShadowColor)
        .frame(
          width: width,
          height: height
        )
    }
  }
}

// MARK: - CheckButtonState

private enum CheckButtonState {
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
    case .default: return .gb_bright_yellow
    case .correct: return .gb_bright_green
    case .incorrect: return .gb_bright_red
    }
  }

  var buttonShadowColor: Color {
    switch self {
    case .default: return .gb_faded_yellow
    case .correct: return .gb_faded_green
    case .incorrect: return .gb_faded_red
    }
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    Color.gb_dark0_hard
    VStack(spacing: 50) {
      CheckButtonView(
        condition: { HandStrength.flush == HandStrength.straight },
        onCheck: {},
        onReset: {}
      )
      CheckButtonView(
        condition: { HandStrength.flush == HandStrength.straight },
        onCheck: {},
        onReset: {}
      )
    }
  }
}
