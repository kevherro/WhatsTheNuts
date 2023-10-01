//
//  FeedbackView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

struct FeedbackView: View {
  @ObservedObject var viewModel: HandStrengthViewModel
  var strongestHandResult: HandResult

  private var isCorrect: Bool {
    return viewModel.handStrength == strongestHandResult.strength
  }

  private let positiveFeedback: [String] = [
    "Nice!",
    "Awesome!",
    "Super!",
    "Terrific!",
    "Stellar!",
    "Yeehaw!",
    "Outstanding!",
  ]

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
          text: positiveFeedback.randomElement() ?? "Yeehaw!"
        )
        .frame(maxHeight: UIScreen.height / 5.5)
      )
    } else {
      return AnyView(
        IncorrectView(strongestHandResult: strongestHandResult)
          .frame(maxHeight: UIScreen.height / 4.3)
      )
    }
  }
}

// MARK: - StatusView

private struct StatusView: View {
  let imageName: String
  let textColor: Color
  let text: String

  var body: some View {
    VStack {
      HStack {
        Image(systemName: imageName)
          .font(.title)
          .bold()
          .foregroundStyle(textColor)
          .padding(.trailing, 5)
        Text(text)
          .font(.largeTitle)
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

// MARK: - IncorrectView

private struct IncorrectView: View {
  var strongestHandResult: HandResult

  var body: some View {
    ZStack {
      StatusView(
        imageName: "x.circle.fill",
        textColor: .gb_bright_red,
        text: "Incorrect"
      )

      VStack {
        HStack {
          Text("Correct answer:")
            .font(.title3)
            .fontDesign(.rounded)
            .fontWeight(.semibold)
            .foregroundStyle(Color.gb_bright_red)
          Spacer()  // Pushes content to the left.
        }
        .padding(.top, 15)
        HStack {
          Text(strongestHandResult.strength.description)
            .font(.headline)
            .fontDesign(.rounded)
            .fontWeight(.regular)
            .foregroundStyle(Color.gb_bright_red)
          Spacer()  // Pushes content to the left.
        }
      }
      .padding(.leading, 17)
      .padding(.bottom, 55)
    }
  }
}

// MARK: - Preview

#Preview {
  FeedbackViewWrapper()
}

private struct FeedbackViewWrapper: View {
  @StateObject private var viewModel = HandStrengthViewModel()

  private let selectedButton = HandStrengthButtonModel(
    id: HandStrength.flush.rawValue,
    handStrength: .flush
  )

  var body: some View {
    ZStack {
      VStack {
        Button(
          action: {
            viewModel.selectedButton = selectedButton
            viewModel.select()
          },
          label: {
            Text("TAP TO ENABLE BUTTONS")
              .fontWeight(.bold)
          }
        )
        .buttonStyle(.borderedProminent)
        FeedbackView(
          viewModel: viewModel,
          strongestHandResult: HandResult(HandStrength.flush, [])
        )
        .background(Color.gb_dark0)
        FeedbackView(
          viewModel: viewModel,
          strongestHandResult: HandResult(HandStrength.royalFlush, [])
        )
        .background(Color.gb_dark0)
      }
    }
  }
}
