//
//  DatePicker+Protocol.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/20/24.
//

import UIKit

protocol DatePickerDelegate: AnyObject {
    func datePickerValueChanged(_ datePicker: UIDatePicker)
}
