//
//  WhatsTheNutsApp.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

@main
struct WhatsTheNutsApp: App {
  @State private var showLaunchScreen = true

  var body: some Scene {
    WindowGroup {
      if showLaunchScreen {
        LaunchScreenView()
          .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
              withAnimation {
                showLaunchScreen = false
              }
            }
          }
      } else {
        ContentView()
      }
    }
  }
}
