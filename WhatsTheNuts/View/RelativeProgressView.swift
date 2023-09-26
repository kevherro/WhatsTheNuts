//
//  RelativeProgressView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/26/23.
//

import SwiftUI

struct RelativeProgressView: View {
  @State private var isTimerStarted = false

  var body: some View {
    ZStack {
      HStack {
        TimerButton(isActive: isTimerStarted) {
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation {
              self.isTimerStarted.toggle()
            }
          }
        }

        if isTimerStarted {
          ProgressView(
            timerInterval: Date()...Date().addingTimeInterval(15),
            label: {},
            currentValueLabel: {}
          )
          .rotationEffect(.degrees(180))
          .tint(.brightGreen)
          .frame(width: UIScreen.width / 1.5)
          .offset(x: 25)
        }
      }
    }
    .frame(width: UIScreen.width / 2)
  }
}

private struct TimerButton: View {
  var isActive: Bool
  var onTap: () -> Void

  var body: some View {
    Button(action: onTap) {
      Image(systemName: "timer")
        .foregroundStyle(isActive ? Color.brightGreen : Color.gray)
    }
  }
}

#Preview {
  RelativeProgressView()
}
