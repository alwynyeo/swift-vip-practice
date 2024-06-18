//
//  TextField+Protocol.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/30/24.
//

import UIKit

protocol TextFieldDelegate: AnyObject {
    func textFieldDidChange(_ textField: UITextField)
}
