//
//  CreateOrderConstants.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/15/24.
//

import Foundation

extension Constants.Scenes {
    struct CreateOrderConstants {
        enum Section: String, CaseIterable {
            case customerContactInfo = "Customer Contact Info"
            case shipmentAddress = "Shipment Address"
            case shipmentMethod = "Shipment Method"
            case paymentInformation = "Payment Information"
            case billingAddress = "Billing Address"
        }

        static let customerContactInfos: [CreateOrder.FormDataSource] = [
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "First Name", inputFieldTag: 0),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Last Name", inputFieldTag: 1),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Phone", inputFieldTag: 2),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Email", inputFieldTag: 3),
        ]

        static let shipmentAddresses: [CreateOrder.FormDataSource] = [
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Street1", inputFieldTag: 4),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Street2", inputFieldTag: 5),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "City", inputFieldTag: 6),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "State", inputFieldTag: 7),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Zip", inputFieldTag: 8),
        ]

        static let shipmentMethods: [CreateOrder.FormDataSource] = [
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Shipping Speed", inputFieldTag: 9),
        ]

        static let paymentInformations: [CreateOrder.FormDataSource] = [
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Credit Card Number", inputFieldTag: 10),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Expiration Date", inputFieldTag: 11),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "CVV", inputFieldTag: 12),
        ]

        static let billingAddresses: [CreateOrder.FormDataSource] = [
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Same As Shipping Address", inputFieldTag: 13),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Street1", inputFieldTag: 14),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Street2", inputFieldTag: 15),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "City", inputFieldTag: 16),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "State", inputFieldTag: 17),
            CreateOrder.FormDataSource(id: UUID().uuidString, title: "Zip", inputFieldTag: 18),
        ]
    }
}
