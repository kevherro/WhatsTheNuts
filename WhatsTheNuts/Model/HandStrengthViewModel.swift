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

  var handStrength: HandStrength {
    guard let rawValue = finalSelection?.id else { return .twoPair }
    return HandStrength(rawValue: rawValue)!
  }

  func select() {
    finalSelection = selectedButton
  }

  func reset() {
    DispatchQueue.main.async {
      self.selectedButton = nil
      self.finalSelection = nil
    }
  }
}

// MARK: - HandStrengthButtonModel

struct HandStrengthButtonModel: Identifiable {
  let id: Int
  let handStrength: HandStrength
}
