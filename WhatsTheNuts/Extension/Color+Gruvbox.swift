//
//  Color+Gruvbox.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

extension Color {
  init(hex: String) {
    let r: Double
    let g: Double
    let b: Double
    let a: Double

    var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

    var hexNumber: UInt64 = 0

    Scanner(string: hexSanitized).scanHexInt64(&hexNumber)

    switch hexSanitized.count {
    case 6:
      r = Double((hexNumber & 0xFF0000) >> 16) / 255.0
      g = Double((hexNumber & 0x00FF00) >> 8) / 255.0
      b = Double(hexNumber & 0x0000FF) / 255.0
      a = 1.0
    case 8:
      r = Double((hexNumber & 0xFF00_0000) >> 24) / 255.0
      g = Double((hexNumber & 0x00FF_0000) >> 16) / 255.0
      b = Double((hexNumber & 0x0000_FF00) >> 8) / 255.0
      a = Double(hexNumber & 0x0000_00FF) / 255.0
    default:
      // Default to black.
      self = .black
      return
    }

    self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
  }
}

extension Color {
  static let gb_dark0_hard = Color(hex: "#1d2021")
  static let gb_dark0 = Color(hex: "#282828")
  static let gb_dark1 = Color(hex: "#3c3836")

  static let gb_light0_hard = Color(hex: "#f9f5d7")

  static let gb_gray_245 = Color(hex: "#928374")

  static let gb_bright_red = Color(hex: "#fb4934")
  static let gb_bright_green = Color(hex: "#b8bb26")
  static let gb_bright_yellow = Color(hex: "#fabd2f")
  static let gb_bright_blue = Color(hex: "#83a598")

  static let gb_neutral_red = Color(hex: "#cc241d")
  static let gb_neutral_green = Color(hex: "#98971a")
  static let gb_neutral_yellow = Color(hex: "#d79921")
  static let gb_neutral_blue = Color(hex: "#458588")

  static let gb_faded_red = Color(hex: "#9d0006")
  static let gb_faded_green = Color(hex: "#79740e")
  static let gb_faded_yellow = Color(hex: "#b57614")
  static let gb_faded_blue = Color(hex: "#076678")
}
