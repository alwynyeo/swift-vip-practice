//
//  UITableView+Extension.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/16/24.
//

import UIKit

extension UITableView {
    // Get the previous index path for cell in UITableView.
    func previousIndexPath(for indexPath: IndexPath) -> IndexPath? {
        let currentSection = indexPath.section
        let currentRow = indexPath.row

        guard currentSection > 0 || currentRow > 0 else { return nil }

        var previousSection = currentSection
        var previousRow = currentRow - 1

        if previousRow < 0 {
            previousSection -= 1
            previousRow = numberOfRows(inSection: previousSection) - 1
        }

        return IndexPath(row: previousRow, section: previousSection)
    }

    // Get the next index path for cell in UITableView.
    func nextIndexPath(for indexPath: IndexPath) -> IndexPath? {
        let currentSection = indexPath.section
        let currentRow = indexPath.row

        let lastSection = numberOfSections - 1
        let lastRow = numberOfRows(inSection: currentSection) - 1

        guard currentSection < lastSection || currentRow < lastRow else {
            return nil
        }

        var nextSection = currentSection
        var nextRow = currentRow + 1

        if nextRow == numberOfRows(inSection: nextSection) {
            nextSection += 1
            nextRow = 0
        }

        return IndexPath(row: nextRow, section: nextSection)
    }
}
