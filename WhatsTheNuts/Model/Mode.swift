//
//  Mode.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

enum Mode {
  case pick
  case rank

  var description: String {
    switch self {
    case .pick:
      return "Pick"
    case .rank:
      return "Rank"
    }
  }
}
