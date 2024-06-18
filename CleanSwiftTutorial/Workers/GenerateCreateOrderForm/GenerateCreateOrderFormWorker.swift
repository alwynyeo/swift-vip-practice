//
//  GenerateCreateOrderFormWorker.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/23/24.
//

import Foundation

final class GenerateCreateOrderFormWorker: GenerateCreateOrderFormProtocol {

    // MARK: - Data

    private let contactInformations: [CreateOrder.GenerateForm.Form] = [
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.firstName, inputType: .textField, inputTag: 1),
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.lastName, inputType: .textField, inputTag: 2),
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.phone, inputType: .textField, inputTag: 3),
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.email, inputType: .textField, inputTag: 4),
    ]

    private let shipmentAddresses: [CreateOrder.GenerateForm.Form] = [
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.shipmentAddressStreet1, inputType: .textField, inputTag: 5),
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.shipmentAddressStreet2, inputType: .textField, inputTag: 6),
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.shipmentAddressCity, inputType: .textField, inputTag: 7),
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.shipmentAddressState, inputType: .textField, inputTag: 8),
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.shipmentAddressZip, inputType: .textField, inputTag: 9),
    ]

    private let shipmentMethods: [CreateOrder.GenerateForm.Form] = [
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.shipmentMethod, inputType: .pickerView),
    ]

    private let paymentInformations: [CreateOrder.GenerateForm.Form] = [
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.creditCard, inputType: .textField, inputTag: 10),
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.expirationDate, inputType: .datePicker),
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.cvv, inputType: .textField, inputTag: 11),
    ]

    private let billingAddresses: [CreateOrder.GenerateForm.Form] = [
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.isSameAsShippingAddress, inputType: .switchToggle),
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.billingAddressStreet1, inputType: .textField, inputTag: 12),
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.billingAddressStreet2, inputType: .textField, inputTag: 13),
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.billingAddressCity, inputType: .textField, inputTag: 14),
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.billingAddressState, inputType: .textField, inputTag: 15),
        CreateOrder.GenerateForm.Form(id: UUID().uuidString, title: CreateOrder.GenerateForm.Form.Title.billingAddressZip, inputType: .textField, inputTag: 16),
    ]

    // MARK: - Operations

    func generateForms() -> [[CreateOrder.GenerateForm.Form]] {
        let forms: [[CreateOrder.GenerateForm.Form]] = [
            contactInformations,
            shipmentAddresses,
            shipmentMethods,
            paymentInformations,
            billingAddresses,
        ]

        return forms
    }
}
