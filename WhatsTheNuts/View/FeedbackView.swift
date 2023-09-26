//
//  FeedbackView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct FeedbackView: View {
  var isCorrect: Bool
  var correctAnswer: HandStrength

  private var screenHeight: CGFloat {
    UIScreen.associatedWithCurrentKeyWindow.bounds.height
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
        IncorrectView(correctAnswer: correctAnswer)
          .frame(maxHeight: screenHeight / 5.8)
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

// MARK: - Preview

#Preview {
  ZStack {
    Color.darkHard
    VStack {
      FeedbackView(isCorrect: true, correctAnswer: .flush)
        .background(Color.dark)
      FeedbackView(isCorrect: false, correctAnswer: .flush)
        .background(Color.dark)
    }
  }
}
