//
//  Selection.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

class Selection: ObservableObject {
  @Published var pressedStates: [HandStrength: Bool] = [:]
  @Published var currentSelection: HandStrength?
  @Published private(set) var finalSelection: HandStrength?

  init(
    pressedStates: [HandStrength: Bool] = [:],
    currentSelection: HandStrength? = nil,
    finalSelection: HandStrength? = nil
  ) {
    self.pressedStates = pressedStates
    self.currentSelection = currentSelection
    self.finalSelection = finalSelection
  }

  func binding(for key: HandStrength) -> Binding<Bool> {
    .init(
      get: { self.pressedStates[key, default: false] },
      set: {
        self.pressedStates[key] = $0
        self.currentSelection = $0 ? key : nil
      }
    )
  }

  func makeFinalSelection() {
    finalSelection = currentSelection ?? finalSelection
  }

  func resetSelection() {
    DispatchQueue.main.async {
      self.pressedStates = [:]
      self.currentSelection = nil
      self.finalSelection = nil
    }
  }
}
