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
      .background(Color.dark)
      .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
  }

  private var content: some View {
    if isCorrect {
      return AnyView(
        StatusView(
          imageName: "checkmark.circle.fill",
          textColor: .brightGreen,
          text: "Nice!"
        )
        .frame(maxHeight: screenHeight / 7)
      )
    } else {
      return AnyView(
        IncorrectView(correctAnswer: strongestHandResult.strength)
          .frame(maxHeight: screenHeight / 5.5)
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
  var correctAnswer: HandStrength

  var body: some View {
    ZStack {
      StatusView(
        imageName: "x.circle.fill",
        textColor: .brightRed,
        text: "Incorrect"
      )

      VStack {
        HStack {
          Text("Correct answer:")
            .font(.callout)
            .fontDesign(.rounded)
            .foregroundStyle(Color.brightRed)
            .bold()
          Spacer()  // Pushes content to the left.
        }
        HStack {
          Text(correctAnswer.description)
            .font(.callout)
            .fontDesign(.rounded)
            .foregroundStyle(Color.brightRed)
          Spacer()  // Pushes content to the left.
        }
      }
      .padding(.leading, 18)
      .padding(.bottom, 32)
    }
  }
}

// MARK: HandResultView

private struct HandResultView: View {
  var handResult: HandResult

  var body: some View {
    ZStack {
      Text("yayaya")
    }
  }
}

// MARK: - Preview

//#Preview {
//  ZStack {
//    Color.darkHard
//    VStack {
//      FeedbackView(isCorrect: true, correctAnswer: HandResult(HandStrength.flush, []))
//        .background(Color.dark)
//      FeedbackView(isCorrect: false, correctAnswer: HandResult(HandStrength.flush, []))
//        .background(Color.dark)
//    }
//    VStack {
//      HandResultView(handResult: HandResult(HandStrength.flush, []))
//    }
//  }
//}
