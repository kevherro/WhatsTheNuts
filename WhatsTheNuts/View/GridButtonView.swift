//
//  GridButtonView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 12/6/23.
//

import SwiftUI

struct GridButtonView<T: Identifiable & CustomStringConvertible>: View {
  let button: T
  var isSelected: Bool
  let action: () -> Void

  @State private var isPressed = false

  var body: some View {
    GridButton(
      isSelected: isSelected,
      isPressed: isPressed,
      text: button.description
    )
    .padding(.horizontal)
    .onTapGesture {
      action()
      isPressed.toggle()
      DispatchQueue.main.asyncAfter(
        deadline: .now() + 0.1,
        qos: .userInteractive
      ) {
        isPressed.toggle()
      }
    }
  }
}

// MARK: - GridButton

private struct GridButton: View {
  var isSelected: Bool
  var isPressed: Bool
  var text: String

  var body: some View {
    ZStack {
      RoundedRectangle(
        cornerRadius: 8,
        style: .continuous
      )
      .fill(Color.gb_dark0_hard)
      .frame(height: 50)
      .overlayStyling(
        isSelected: isSelected,
        text: text
      )
      .offset(y: isPressed ? 0 : -2.7)
      .zIndex(1)
      RoundedRectangle(cornerRadius: 10)
        .fill(isSelected ? Color.gb_bright_green : Color.gb_gray_245)
        .frame(height: 50)
    }
  }
}
