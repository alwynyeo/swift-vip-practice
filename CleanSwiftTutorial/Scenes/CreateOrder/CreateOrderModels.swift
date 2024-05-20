//
//  CreateOrderModels.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 4/7/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - CreateOrder Enum
enum CreateOrder {
    enum Something {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }

    enum FormatExpirationDate {
        struct Request {
            let date: Date
        }

        struct Response {
            let date: Date
        }

        struct ViewModel {
            let dateString: String
        }
    }

    struct FormDataSource: Hashable {
        enum InputType {
            case textField
            case switchToggle
            case datePicker
            case pickerView
        }

        let id: String
        let title: String
        let inputType: InputType
        
        var inputTag: Int? = nil

        init(id: String, title: String, inputType: InputType, inputTag: Int? = nil) {
            self.id = id
            self.title = title
            self.inputType = inputType
            self.inputTag = inputTag
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

        static func == (lhs: FormDataSource, rhs: FormDataSource) -> Bool {
            return lhs.id == rhs.id
        }
    }
}
