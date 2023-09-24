//
//  ModePicker.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct ModePicker: View {
  @State private var selection = 0

  var body: some View {
    Picker("Game Mode", selection: $selection) {
      Text(Mode.pick.description).tag(0)
      Text(Mode.rank.description).tag(1)
    }
    .pickerStyle(.segmented)
    .frame(width: 150)
  }
}

// MARK: - Preview

#Preview {
  ModePicker()
}
