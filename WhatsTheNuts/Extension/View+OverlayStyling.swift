//
//  View+OverlayStyling.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 12/6/23.
//

import SwiftUI

extension View {
  func overlayStyling(
    isSelected: Bool,
    text: String
  ) -> some View {
    self.overlay(
      RoundedRectangle(
        cornerRadius: 8,
        style: .continuous
      )
      .stroke(
        isSelected ? Color.gb_bright_green : Color.gb_gray_245,
        lineWidth: 2
      )
      .fill(isSelected ? Color.gb_faded_green.opacity(0.1) : .clear)
    )
    .overlay(
      Text(text)
        .font(.title3)
        .fontDesign(.rounded)
        .fontWeight(.semibold)
        .kerning(0.5)
        .foregroundStyle(isSelected ? Color.gb_bright_green : Color.gb_gray_245)
    )
  }
}
