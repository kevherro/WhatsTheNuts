//
//  Color+Gruvbox.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

extension Color {
  init(red: Int, green: Int, blue: Int) {
    self.init(
      red: Double(red) / 255.0,
      green: Double(green) / 255.0,
      blue: Double(blue) / 255.0
    )
  }

  static let darkHard = Color(red: 29, green: 32, blue: 33)
  static let dark = Color(red: 50, green: 48, blue: 47)
  static let brightGreen = Color(red: 184, green: 187, blue: 38)
  static let fadedGreen = Color(red: 121, green: 116, blue: 14)
  static let brightRed = Color(red: 251, green: 73, blue: 52)
  static let fadedRed = Color(red: 157, green: 0, blue: 6)
  static let brightBlue = Color(red: 131, green: 165, blue: 152)
  static let grey = Color(red: 146, green: 131, blue: 116)
  static let fadedYellow = Color(red: 181, green: 118, blue: 20)
  static let text = Color(red: 235, green: 219, blue: 178)
}
