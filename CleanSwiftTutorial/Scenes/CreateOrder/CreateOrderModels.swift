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

    enum GenerateForm {
        struct Request {}

        struct Response {
            let forms: [[Form]]
        }

        struct ViewModel {
            let contactInformations: [Form]
            let shipmentAddresses: [Form]
            let shipmentMethods: [Form]
            let paymentInformations: [Form]
            let billingAddresses: [Form]
        }

        struct Form: Hashable {
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

            static func == (lhs: Form, rhs: Form) -> Bool {
                return lhs.id == rhs.id
            }
        }
    }
}
