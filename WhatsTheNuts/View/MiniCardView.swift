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
      ForEach(0..<cards.count, id: \.self) { index in
        CardView(card: cards[cards.count - index - 1])
          .offset(x: CGFloat(index * 26))
      }
      Rectangle()
        .fill(Color.gb_dark0)
        .zIndex(1)
        .frame(width: 210, height: 80)
        .offset(x: 52, y: 40)
    }
    .offset(x: -50)
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    Color.gb_dark0
    MiniCardView(cards: [
      Card(rank: .ace, suit: .clubs),
      Card(rank: .ace, suit: .spades),
      Card(rank: .ace, suit: .hearts),
      Card(rank: .ace, suit: .diamonds),
      Card(rank: .king, suit: .clubs),
    ])
  }
}
