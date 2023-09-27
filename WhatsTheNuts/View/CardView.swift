//
//  CardView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

// MARK: CardView

struct CardView: View {
  var card: Card

  private var color: Color {
    switch card.suit {
    case .hearts, .diamonds:
      return .red
    case .clubs, .spades:
      return .black
    }
  }

  var body: some View {
    RoundedRectangle(cornerRadius: 5)
      .fill(.white)
      .stroke(Color.gb_bright_blue, lineWidth: 2)
      .frame(width: 100, height: 150)
      .overlay(
        PipView(rank: card.rank, suit: card.suit)
          .foregroundStyle(color)
          .padding([.top, .leading], 7),
        alignment: .topLeading
      )
      .overlay(
        PipView(rank: card.rank, suit: card.suit)
          .foregroundStyle(color)
          .rotationEffect(.degrees(180))
          .padding([.bottom, .trailing], 7),
        alignment: .bottomTrailing
      )
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    Color.gb_dark0_hard
    HStack {
      CardView(card: Card(rank: .ace, suit: .hearts))
      CardView(card: Card(rank: .ace, suit: .clubs))
    }
  }
}
