//
//  Array+Operations.swift
//  WhatsTheNuts
//
//  Created by Kevin Herro on 9/24/23.
//

extension Array {
  func combinations(ofCount k: Int) -> [[Element]] {
    guard k > 0 else { return [[]] }
    guard !isEmpty else { return [] }

    var withoutFirst: [Element] = []
    withoutFirst.append(contentsOf: self[1...])
    var includingFirst: [[Element]] = withoutFirst.combinations(ofCount: k - 1)
    includingFirst = includingFirst.map { [self[0]] + $0 }

    return includingFirst + withoutFirst.combinations(ofCount: k)
  }

  func product<T>(with other: [T]) -> [(Element, T)] {
    var result: [(Element, T)] = []
    for item in self {
      for otherItem in other {
        result.append((item, otherItem))
      }
    }
    return result
  }
}
