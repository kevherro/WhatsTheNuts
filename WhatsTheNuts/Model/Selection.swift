//
//  Selection.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

class Selection: ObservableObject {
  @Published var pressedStates: [HandRank: Bool] = [:]
  @Published var currentSelection: HandRank?
  @Published private(set) var finalSelection: HandRank?

  func binding(for key: HandRank) -> Binding<Bool> {
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
