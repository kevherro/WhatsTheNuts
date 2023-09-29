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
  var strokeColor: Color = .gb_bright_blue
  var lineWidth: CGFloat = 1
  var cornerRadius: CGFloat = 11
  var maxWidth: CGFloat = UIScreen.width / 2

  var body: some View {
    card.image
      .resizable()
      .scaledToFit()
      .frame(maxWidth: maxWidth)
      .overlay(
        RoundedRectangle(cornerRadius: cornerRadius)
          .fill(Color.clear)
          .stroke(strokeColor, lineWidth: lineWidth)
      )
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    Color.gb_dark0_hard
    HStack {
      CardView(card: Constants().deck[0])
    }
  }
}
