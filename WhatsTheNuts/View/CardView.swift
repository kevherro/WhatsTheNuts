//
//  CardView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct CardView: View {
  var card: CardModel
  var width: CGFloat = UIScreen.width / 2

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
          .padding(.top, 9)
          .padding(.leading, 12),
        alignment: .topLeading
      )
      .overlay(
        Image(systemName: card.suit.iconName)
          .foregroundStyle(color)
          .font(.system(size: 60))
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
