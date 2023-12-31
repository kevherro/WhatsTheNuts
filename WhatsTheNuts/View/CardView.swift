//
//  CardView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct CardView: View {
  var card: CardModel

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
      .frame(width: 115, height: 170)
      .overlay(
        Text(card.rank.description)
          .font(.system(size: 60))
          .fontDesign(.monospaced)
          .foregroundStyle(color)
          .padding(.top, 9)
          .padding(.leading, 12),
        alignment: .topLeading
      )
      .overlay(
        Image(systemName: card.suit.iconName)
          .foregroundStyle(color)
          .font(.system(size: 70))
          .padding([.bottom, .trailing], 5),
        alignment: .bottomTrailing
      )
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    Color.gb_dark0_hard
    HStack {
      CardView(card: CardModel(rank: .ace, suit: .hearts))
      CardView(card: CardModel(rank: .ace, suit: .diamonds))
    }
    .offset(y: -100)
    HStack {
      CardView(card: CardModel(rank: .ace, suit: .clubs))
      CardView(card: CardModel(rank: .ace, suit: .spades))
    }
    .offset(y: 100)
  }
}
