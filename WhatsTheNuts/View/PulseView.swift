//
//  PulseView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 12/6/23.
//

import SwiftUI

struct PulseView: View {
  @State private var isAnimating = false

  var body: some View {
    Circle()
      .stroke(lineWidth: 3)
      .frame(maxWidth: UIScreen.width / 10)
      .foregroundColor(.gb_bright_green)
      .opacity(isAnimating ? 0 : 1)
      .scaleEffect(isAnimating ? 2 : 0)
      .onAppear {
        withAnimation(Animation.easeOut(duration: 0.7)) {
          isAnimating = true
        }
      }
  }
}

#Preview {
  PulseView()
}
