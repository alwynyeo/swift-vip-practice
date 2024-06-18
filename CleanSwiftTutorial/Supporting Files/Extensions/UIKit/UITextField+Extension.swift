//
//  UITextField+Extension.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/30/24.
//

import UIKit

extension UITextField {
    func textDidChangeObserver(handler: @escaping (_ action: UIAction) -> Void) {
        let action = UIAction { [weak self] action in
            guard let self else { return }
            handler(action)
        }

        addAction(action, for: .editingChanged)
    }
}
