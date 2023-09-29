//
//  MiniCardView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/27/23.
//

import SwiftUI

struct MiniCardView: View {
  var cards: [Card]

  var body: some View {
    ZStack {
      // This rectangle defines the visible area
      Rectangle()
        .fill(Color.clear)  // Make sure it's clear to only use it as a clip shape

      ZStack {
        ForEach(0..<cards.count, id: \.self) { index in
          CardView(
            card: cards[cards.count - index - 1],
            width: UIScreen.width / 3
          )
          .offset(x: CGFloat(index * 20))
        }
      }
      .clipShape(
        Rectangle()  // Clip the ZStack using a rectangle
          .size(width: 250, height: 65)  // Define the size of the rectangle (visible area)
      )
      .offset(x: -50)
    }
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    Color.white
    MiniCardView(cards: Array(Deck().allCards.prefix(5)))
  }
}
