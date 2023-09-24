//
//  UIScreen+CurrentScreen.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

import SwiftUI

// MARK: UIWindow

extension UIWindow {
  static var currentKey: UIWindow? {
    return UIApplication.shared.connectedScenes
      .compactMap { $0 as? UIWindowScene }
      .flatMap { $0.windows }
      .first { $0.isKeyWindow }
  }
}

// MARK: UIScreen

extension UIScreen {
  static var associatedWithCurrentKeyWindow: UIScreen {
    // Only use the deprecated version if we have to.
    return UIWindow.currentKey?.screen ?? UIScreen.main
  }
}
