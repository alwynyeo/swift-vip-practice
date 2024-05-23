//
//  CreateOrderPresenter.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 4/7/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - CreateOrderPresentationLogic Protocol
protocol CreateOrderPresentationLogic {
    func presentGeneratedForms(response: CreateOrder.GenerateForm.Response)
    func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response)
}

// MARK: - CreateOrderPresenter Class
final class CreateOrderPresenter {
    // MARK: - Declarations

    weak var viewController: CreateOrderDisplayLogic?

    private var dateFormatter: DateFormatter?

    // MARK: - Object Lifecycle

    init() {
        dateFormatter = DateFormatter()
        dateFormatter?.dateStyle = .short
        dateFormatter?.timeStyle = .none
    }
}

// MARK: - CreateOrderPresentationLogic Extension
extension CreateOrderPresenter: CreateOrderPresentationLogic {
    func presentGeneratedForms(response: CreateOrder.GenerateForm.Response) {
        let forms = response.forms

        let contactInformations = forms[0]
        let shipmentAddresses = forms[1]
        let shipmentMethods = forms[2]
        let paymentInformations = forms[3]
        let billingAddresses = forms[4]

        let viewModel = CreateOrder.GenerateForm.ViewModel(
            contactInformations: contactInformations,
            shipmentAddresses: shipmentAddresses,
            shipmentMethods: shipmentMethods,
            paymentInformations: paymentInformations,
            billingAddresses: billingAddresses
        )

        viewController?.displayGeneratedForms(viewModel: viewModel)
    }

    func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response) {
        let date = response.date

        guard let dateString = dateFormatter?.string(from: date) else { return }

        let viewModel = CreateOrder.FormatExpirationDate.ViewModel(dateString: dateString)
        
        viewController?.displayExpirationDate(viewModel: viewModel)
    }
}
