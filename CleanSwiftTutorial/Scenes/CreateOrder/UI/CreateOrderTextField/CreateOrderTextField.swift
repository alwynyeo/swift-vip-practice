//
//  CreateOrderTextField.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/17/24.
//

import UIKit

final class CreateOrderTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
}

// MARK: - Configuration
private extension CreateOrderTextField {
    func configureUI() {
        borderStyle = .roundedRect
    }
}

// MARK: - Comparable
extension CreateOrderTextField: Comparable {
    static func < (lhs: CreateOrderTextField, rhs: CreateOrderTextField) -> Bool {
        return lhs.tag < rhs.tag
    }
}
