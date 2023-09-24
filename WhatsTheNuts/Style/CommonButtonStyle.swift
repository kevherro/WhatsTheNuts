//
//  CommonButtonStyle.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

protocol ButtonState {
  var textColor: Color { get }
  var buttonColor: Color { get }
  var buttonShadowColor: Color { get }
}

struct CommonButtonStyle<T: ButtonState>: ButtonStyle {
  var buttonState: T
  var buttonHeight: CGFloat
  var strokeWidth: CGFloat
  var normalOffset: CGFloat
  var pressedOffset: CGFloat
  var animationDuration: Double
  var kerning: CGFloat
  var zIndex: Double

  init(
    buttonState: T,
    buttonHeight: CGFloat = 30,
    strokeWidth: CGFloat = 1.5,
    normalOffset: CGFloat = 35,
    pressedOffset: CGFloat = 38,
    animationDuration: Double = 0.05,
    kerning: CGFloat = 0.3,
    zIndex: Double = 1
  ) {
    self.buttonState = buttonState
    self.buttonHeight = buttonHeight
    self.strokeWidth = strokeWidth
    self.normalOffset = normalOffset
    self.pressedOffset = pressedOffset
    self.animationDuration = animationDuration
    self.kerning = kerning
    self.zIndex = zIndex
  }

  func makeBody(configuration: Configuration) -> some View {
    ZStack {
      VStack {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .fill(buttonState.buttonColor)
          .frame(height: buttonHeight)
          .overlay(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
              .stroke(buttonState.buttonShadowColor, lineWidth: strokeWidth)
          )
          .overlay(
            configuration.label
              .fontDesign(.rounded)
              .foregroundStyle(buttonState.textColor)
              .fontWeight(.bold)
              .kerning(kerning)
          )
          .offset(y: configuration.isPressed ? pressedOffset : normalOffset)
          .animation(.snappy(duration: animationDuration), value: 0)
          .zIndex(zIndex)
        RoundedRectangle(cornerRadius: 8)
          .stroke(buttonState.buttonShadowColor, lineWidth: strokeWidth)
          .fill(buttonState.buttonShadowColor)
          .frame(height: buttonHeight)
      }
    }
    .padding(.horizontal)
  }
}
