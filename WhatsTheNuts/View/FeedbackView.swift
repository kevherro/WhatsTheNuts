//
//  FeedbackView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct FeedbackView: View {
  @ObservedObject var selection: Selection

  var strongestHandResult: HandResult

  private var isCorrect: Bool {
    return selection.finalSelection == strongestHandResult.strength
  }

  private var screenHeight: CGFloat {
    UIScreen.height
  }

  var body: some View {
    content
      .frame(maxWidth: .infinity)
      .background(Color.gb_dark1)
      .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
  }

  private var content: some View {
    if isCorrect {
      return AnyView(
        StatusView(
          imageName: "checkmark.circle.fill",
          textColor: .gb_bright_green,
          text: "Nice!"
        )
        .frame(maxHeight: screenHeight / 5.5)
      )
    } else {
      return AnyView(
        IncorrectView(strongestHandResult: strongestHandResult)
          .frame(maxHeight: screenHeight / 4.5)
      )
    }
  }
}

// MARK: StatusView

private struct StatusView: View {
  let imageName: String
  let textColor: Color
  let text: String

  var body: some View {
    VStack {
      HStack {
        Image(systemName: imageName)
          .bold()
          .foregroundStyle(textColor)
          .padding(.trailing, 5)
        Text(text)
          .font(.title2)
          .fontDesign(.rounded)
          .bold()
          .foregroundStyle(textColor)
        Spacer()  // Pushes content to the left.
      }
      .padding(.top, 10)
      .padding(.leading, 17)
      Spacer()  // Pushes content to the top.
    }
  }
}

// MARK: IncorrectView

private struct IncorrectView: View {
  var strongestHandResult: HandResult

  var body: some View {
    ZStack {
      StatusView(
        imageName: "x.circle.fill",
        textColor: .gb_bright_red,
        text: "Incorrect"
      )

      MiniCardView(cards: strongestHandResult.cards)
        .offset(x: 70, y: 10)

      VStack {
        HStack {
          Text("Correct answer:")
            .font(.callout)
            .fontDesign(.rounded)
            .foregroundStyle(Color.gb_bright_red)
            .bold()
          Spacer()  // Pushes content to the left.
        }
        HStack {
          Text(strongestHandResult.strength.description)
            .font(.callout)
            .fontDesign(.rounded)
            .foregroundStyle(Color.gb_bright_red)
          Spacer()  // Pushes content to the left.
        }
      }
      .padding(.leading, 18)
      .padding(.bottom, 70)
    }
  }
}

// MARK: - Preview

#Preview {
  FeedbackViewWrapper()
}

private struct FeedbackViewWrapper: View {
  @StateObject private var selection: Selection = Selection(finalSelection: .flush)

  private let cards: [Card] = Array(Constants().deck.prefix(5))

  var body: some View {
    ZStack {
      VStack {
        FeedbackView(selection: selection, strongestHandResult: HandResult(HandStrength.flush, []))
          .background(Color.gb_dark0)
        FeedbackView(
          selection: selection, strongestHandResult: HandResult(HandStrength.royalFlush, cards)
        )
        .background(Color.gb_dark0)
      }
    }
  }
}
