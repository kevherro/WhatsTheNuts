//
//  NutsViewModel.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 12/6/23.
//

import SwiftUI

private let controller: NutsController = NutsController()

final class NutsViewModel: ObservableObject {
  @Published var communityCards = controller.communityCards
  @Published var nuts = controller.nuts()

  func startNewRound() {
    let controller: NutsController = NutsController()
    communityCards = controller.communityCards
    nuts = controller.nuts()
  }
}
