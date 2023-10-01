//
//  HandStrengthsGridView.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/30/23.
//

import SwiftUI

struct HandStrengthsGridView: View {
  @ObservedObject var selection: Selection

  @StateObject private var viewModel = ViewModel()

  private let buttons: [ButtonModel] = HandStrength.allCases.map {
    ButtonModel(id: $0.rawValue, title: $0.description)
  }

  var body: some View {
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    LazyVGrid(columns: columns) {
      ForEach(buttons) { button in
        ButtonView(button: button, isSelected: viewModel.selectedButton?.id == button.id) {
          viewModel.selectedButton = button
          selection.currentSelection = HandStrength(rawValue: button.id)
        }
        .padding(.horizontal, 9)
        .padding(.vertical, -10)
        .disabled(selection.finalSelection != nil)
      }
    }
  }
}

private struct ButtonView: View {
  let button: ButtonModel
  var isSelected: Bool
  let action: () -> Void

  @State private var isPressed = false

  var body: some View {
    Button(isSelected: isSelected, isPressed: isPressed, text: button.title)
      .padding(.horizontal)
      .onTapGesture {
        action()
        isPressed.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, qos: .userInteractive) {
          isPressed.toggle()
        }
      }
  }
}

private struct ButtonModel: Identifiable {
  let id: Int
  let title: String
}

private class ViewModel: ObservableObject {
  @Published var selectedButton: ButtonModel?
}

private struct Button: View {
  var isSelected: Bool
  var isPressed: Bool
  var text: String

  var body: some View {
    ZStack {
      VStack {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .fill(Color.gb_dark0_hard)
          .frame(height: 40)
          .overlayStyling(isSelected: isSelected, text: text)
          .offset(y: isPressed ? 48 : 43)
          .zIndex(1)
        RoundedRectangle(cornerRadius: 12)
          .fill(isSelected ? Color.gb_light0_hard : Color.gb_gray_245)
          .frame(height: 40)
      }
    }
  }
}

extension View {
  fileprivate func overlayStyling(isSelected: Bool, text: String) -> some View {
    self.overlay(
      RoundedRectangle(cornerRadius: 8, style: .continuous)
        .stroke(isSelected ? Color.gb_light0_hard : Color.gb_gray_245, lineWidth: 1)
    )
    .overlay(
      Text(text)
        .font(.title3)
        .fontDesign(.rounded)
        .foregroundStyle(isSelected ? Color.gb_light0_hard : Color.gb_gray_245)
        .fontWeight(.semibold)
        .kerning(0.5)
    )
  }
}

#Preview {
  ZStack {
    Color.gb_dark0
    HandStrengthsViewWrapper()
  }
}

private struct HandStrengthsViewWrapper: View {
  @StateObject private var selection = Selection()

  var body: some View {
    ZStack {
      Color.gb_dark0_hard
      HandStrengthsGridView(selection: selection)
    }
  }
}
