//
//  CreateOrderConstants.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/15/24.
//

import Foundation

extension Constants.Scenes {
    struct CreateOrderConstants {
        static let customerContactInfos: [CreateOrder.FormDataSource] = [
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "First Name", inputType: .textField, inputTag: 1),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Last Name", inputType: .textField, inputTag: 2),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Phone", inputType: .textField, inputTag: 3),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Email", inputType: .textField, inputTag: 4),
        ]

        static let shipmentAddresses: [CreateOrder.FormDataSource] = [
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Street1", inputType: .textField, inputTag: 5),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Street2", inputType: .textField, inputTag: 6),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "City", inputType: .textField, inputTag: 7),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "State", inputType: .textField, inputTag: 8),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Zip", inputType: .textField, inputTag: 9),
        ]

        static let shipmentMethods: [CreateOrder.FormDataSource] = [
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Shipping Speed", inputType: .pickerView),
        ]
        
        static let paymentInformations: [CreateOrder.FormDataSource] = [
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Credit Card Number", inputType: .textField, inputTag: 10),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Expiration Date", inputType: .datePicker),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "CVV", inputType: .textField, inputTag: 11),
        ]

        static let billingAddresses: [CreateOrder.FormDataSource] = [
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Same As Shipping Address", inputType: .switchToggle),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Street1", inputType: .textField, inputTag: 12),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Street2", inputType: .textField, inputTag: 13),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "City", inputType: .textField, inputTag: 14),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "State", inputType: .textField, inputTag: 15),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Zip", inputType: .textField, inputTag: 16),
        ]
    }
}
