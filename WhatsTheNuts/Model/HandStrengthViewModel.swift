//
//  HandStrengthViewModel.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 10/1/23.
//

import SwiftUI

// MARK: - HandStrengthViewModel

class HandStrengthViewModel: ObservableObject {
  @Published var selectedButton: HandStrengthButtonModel?
  @Published var finalSelection: HandStrengthButtonModel?
  @Published var shouldRefreshButtons: Bool = false

  var handStrength: HandStrength? {
    return finalSelection?.handStrength ?? selectedButton?.handStrength
  }

  func lock() {
    finalSelection = selectedButton
  }

  func startNewRound() {
    DispatchQueue.main.async {
      self.selectedButton = nil
      self.finalSelection = nil
      self.shouldRefreshButtons = true
    }
  }

  func resetRefreshTrigger() {
    shouldRefreshButtons = false
  }
}

// MARK: - HandStrengthButtonModel

struct HandStrengthButtonModel: Identifiable & CustomStringConvertible {
  let id: Int
  let handStrength: HandStrength

  var description: String {
    return handStrength.description
  }
}
