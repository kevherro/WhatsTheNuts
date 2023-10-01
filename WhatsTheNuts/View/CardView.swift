//
//  CardView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct CardView: View {
  var card: Card
  var width: CGFloat = UIScreen.width / 2

  var body: some View {
    card.image
      .resizable()
      .scaledToFit()
      .frame(width: width)
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    Color.gb_dark0_hard
    HStack {
      CardView(card: Deck().allCards[0])
    }
  }
}
