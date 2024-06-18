//
//  Array+Comparable+Extension.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/17/24.
//

import Foundation

extension Array where Element: Comparable {
    func isSorted() -> Bool {
        let array = self
        let count = array.count
        for index in 1..<count {
            let currentIndex = array[index]
            let previousIndex = array[index - 1]
            if currentIndex < previousIndex {
                return false
            }
        }
        return true
    }

    func isAscending() -> Bool {
        let array = self
        return zip(array, array.dropFirst()).allSatisfy(<=)
    }

    func isDescending() -> Bool {
        let array = self
        return zip(self, array.dropFirst()).allSatisfy(>=)
    }
}
