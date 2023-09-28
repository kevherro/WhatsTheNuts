//
//  PipView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/27/23.
//

import SwiftUI

struct PipView: View {
  var rank: Rank
  var suit: Suit

  var body: some View {
    VStack {
      Text(rank.description)
        .font(.system(size: 23, design: .rounded))
        .kerning(-1)

      Image(systemName: suit.iconName)
        .font(.system(size: 12, design: .rounded))
    }
  }
}

// MARK: - Preview

#Preview {
  VStack {
    PipView(rank: .ace, suit: .clubs)
      .padding(.bottom, 25)

    PipView(rank: .queen, suit: .clubs)
      .padding(.bottom, 25)
  }
}
