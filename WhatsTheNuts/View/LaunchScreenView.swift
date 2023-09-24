//
//  LaunchScreenView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct LaunchScreenView: View {
  @State private var isAnimating = false

  var body: some View {
    ZStack {
      Color.darkHard.ignoresSafeArea()
      GeometryReader { geometry in
        VStack {
          Image("LaunchScreen")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
            .scaleEffect(isAnimating ? 1.0 : 0.8)

          Text("What's the Nuts?")
            .foregroundStyle(Color.text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .scaleEffect(isAnimating ? 1.0 : 0.8)
        }
        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        .ignoresSafeArea(.all)
        .onAppear {
          withAnimation(.easeOut(duration: 1.0)) {
            isAnimating = true
          }
        }
      }
    }
  }
}

// MARK: - Preview

#Preview {
  LaunchScreenView()
}
