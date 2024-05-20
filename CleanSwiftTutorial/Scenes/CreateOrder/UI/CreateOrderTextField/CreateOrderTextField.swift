//
//  CreateOrderTextField.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/17/24.
//

import UIKit

final class CreateOrderTextField: UITextField {
    // MARK: - Object Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }

    // MARK: - Helpers

    private func configureUI() {
        borderStyle = .roundedRect
    }
}

// MARK: - Comparable
extension CreateOrderTextField: Comparable {
    static func < (lhs: CreateOrderTextField, rhs: CreateOrderTextField) -> Bool {
        return lhs.tag < rhs.tag
    }
}
