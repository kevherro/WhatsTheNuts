//
//  RelativeProgressView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/26/23.
//

import SwiftUI

struct RelativeProgressView: View {
  @State private var isTimerStarted = false
  @State private var timer: Timer? = nil

  private let timerDuration: TimeInterval = 15

  var body: some View {
    ZStack {
      HStack {
        TimerButton(isActive: isTimerStarted) {
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation {
              self.isTimerStarted.toggle()
              self.startTimer()
            }
          }
        }

        if isTimerStarted {
          ProgressView(
            timerInterval: Date()...Date().addingTimeInterval(timerDuration),
            label: {},
            currentValueLabel: {}
          )
          .rotationEffect(.degrees(180))
          .tint(.brightGreen)
          .frame(width: UIScreen.width / 1.5)
          .onDisappear {
            timer?.invalidate()
          }
        }
      }
    }
    .frame(width: UIScreen.width / 2)
  }

  private func startTimer() {
    timer?.invalidate()
    timer = Timer.scheduledTimer(
      withTimeInterval: timerDuration,
      repeats: false
    ) { _ in
      withAnimation {
        self.isTimerStarted = false
      }
    }
  }
}

private struct TimerButton: View {
  var isActive: Bool
  var onTap: () -> Void

  var body: some View {
    Button(action: onTap) {
      Image(systemName: "timer")
        .resizable()
        .frame(width: 25, height: 25)
        .foregroundStyle(isActive ? Color.brightGreen : Color.gray)
        .bold(isActive)
    }
  }
}

#Preview {
  RelativeProgressView()
}
