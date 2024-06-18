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
    struct CreateOrderFormField {
        // MARK: - Contact info
        let firstName: String
        let lastName: String
        let phone: String
        let email: String

        // MARK: Payment info
        let paymentMethodCreditCardNumber: String
        let paymentMethodCVV: String
        let paymentMethodExpirationDate: Date
        let paymentMethodExpirationDateString: String

        let billingAddressStreet1: String
        let billingAddressStreet2: String
        let billingAddressCity: String
        let billingAddressState: String
        let billingAddressZIP: String

        // MARK: Shipping info
        let shipmentAddressStreet1: String
        var shipmentAddressStreet2: String?
        let shipmentAddressCity: String
        let shipmentAddressState: String
        let shipmentAddressZIP: String
        let shipmentMethodSpeed: Int
        let shipmentMethodSpeedString: String

        // MARK: Miscellaneous
        var id: String?
        let date: Date
        let total: Decimal

        init(
            firstName: String,
            lastName: String,
            phone: String,
            email: String,
            paymentMethodCreditCardNumber: String,
            paymentMethodCVV: String,
            paymentMethodExpirationDate: Date,
            paymentMethodExpirationDateString: String,
            billingAddressStreet1: String,
            billingAddressStreet2: String,
            billingAddressCity: String,
            billingAddressState: String,
            billingAddressZIP: String,
            shipmentAddressStreet1: String,
            shipmentAddressStreet2: String? = nil,
            shipmentAddressCity: String,
            shipmentAddressState: String,
            shipmentAddressZIP: String,
            shipmentMethodSpeed: Int,
            shipmentMethodSpeedString: String,
            id: String? = nil,
            date: Date,
            total: Decimal
        ) {
            self.firstName = firstName
            self.lastName = lastName
            self.phone = phone
            self.email = email
            self.paymentMethodCreditCardNumber = paymentMethodCreditCardNumber
            self.paymentMethodCVV = paymentMethodCVV
            self.paymentMethodExpirationDate = paymentMethodExpirationDate
            self.paymentMethodExpirationDateString = paymentMethodExpirationDateString
            self.billingAddressStreet1 = billingAddressStreet1
            self.billingAddressStreet2 = billingAddressStreet2
            self.billingAddressCity = billingAddressCity
            self.billingAddressState = billingAddressState
            self.billingAddressZIP = billingAddressZIP
            self.shipmentAddressStreet1 = shipmentAddressStreet1
            self.shipmentAddressStreet2 = shipmentAddressStreet2
            self.shipmentAddressCity = shipmentAddressCity
            self.shipmentAddressState = shipmentAddressState
            self.shipmentAddressZIP = shipmentAddressZIP
            self.shipmentMethodSpeed = shipmentMethodSpeed
            self.shipmentMethodSpeedString = shipmentMethodSpeedString
            self.id = id
            self.date = date
            self.total = total
        }
    }

    enum CreateOrder {
        struct Request {
            let formField: CreateOrderFormField
        }

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

            struct Title {
                static let firstName = "First Name"
                static let lastName = "Last Name"
                static let phone = "Phone"
                static let email = "Email"

                static let shipmentAddressStreet1 = "Street1"
                static let shipmentAddressStreet2 = "Street2"
                static let shipmentAddressCity = "City"
                static let shipmentAddressState = "State"
                static let shipmentAddressZip = "Zip"

                static let shipmentMethod = "Shipping Speed"

                static let creditCard = "Credit Card Number"
                static let expirationDate = "Expiration Date"
                static let cvv = "CVV"

                static let isSameAsShippingAddress = "Same As Shipping Address"

                static let billingAddressStreet1 = "Street1"
                static let billingAddressStreet2 = "Street2"
                static let billingAddressCity = "City"
                static let billingAddressState = "State"
                static let billingAddressZip = "Zip"
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
