//
//  PipView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 12/6/23.
//

import SwiftUI

struct PipView: View {
  var rank: Rank
  var suit: Suit

  var body: some View {
    VStack {
      Text(rank.description)
        .font(.system(size: 40, design: .rounded))

      Image(systemName: suit.iconName)
        .font(.system(size: 20))
    }
  }
}

#Preview {
  PipView(rank: .ace, suit: .clubs)
}
