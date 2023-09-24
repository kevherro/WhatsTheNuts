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
    case .heart, .diamond:
      return .red
    case .club, .spade:
      return .black
    }
  }

  var body: some View {
    RoundedRectangle(cornerRadius: 5)
      .fill(.white)
      .stroke(Color.brightBlue, lineWidth: 2)
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

// MARK: - PipView

private struct PipView: View {
  var rank: Rank
  var suit: Suit

  var body: some View {
    VStack {
      Text(rank.description)
        .font(.system(size: 23, design: .rounded))

      Image(systemName: suit.iconName)
        .font(.system(size: 12, design: .rounded))
    }
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    Color.darkHard
    VStack {
      HStack {
        PipView(rank: .ace, suit: .club)
      }

      .padding(.bottom, 100)

      HStack {
        CardView(card: Card(rank: .ace, suit: .heart))
        CardView(card: Card(rank: .ace, suit: .club))
      }
    }
  }
}
