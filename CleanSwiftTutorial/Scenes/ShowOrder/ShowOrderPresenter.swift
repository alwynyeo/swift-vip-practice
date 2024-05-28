//
//  ShowOrderPresenter.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/24/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - ShowOrderPresentationLogic Protocol
protocol ShowOrderPresentationLogic {
    func presentOrder(response: ShowOrder.GetOrder.Response)
}

// MARK: - ShowOrderPresenter Class
final class ShowOrderPresenter {
    // MARK: - Declarations

    weak var viewController: ShowOrderDisplayLogic?

    private let dateFormatter: DateFormatter

    private let currencyFormatter: NumberFormatter

    // MARK: - Object Lifecycle

    init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none

        currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
    }
}

// MARK: - ShowOrderPresentationLogic Extension
extension ShowOrderPresenter: ShowOrderPresentationLogic {
    func presentOrder(response: ShowOrder.GetOrder.Response) {
        let responseOrder = response.order

        let createdDate = responseOrder.createdDate
        let formattedCreatedDate = dateFormatter.string(from: createdDate)

        let totalPrice = responseOrder.totalPrice as NSNumber
        let formattedTotalPrice = currencyFormatter.string(from: totalPrice) ?? ""

        let orderId = responseOrder.id

        let firstName = responseOrder.contactInformation.firstName
        let lastName = responseOrder.contactInformation.lastName
        let fullName = firstName + " " + lastName

        let email = responseOrder.contactInformation.email

        let order = ShowOrder.GetOrder.ViewModel.Order(
            createdDate: formattedCreatedDate,
            totalPrice: formattedTotalPrice,
            orderId: orderId,
            fullName: fullName,
            email: email
        )

        let viewModel = ShowOrder.GetOrder.ViewModel(order: order)

        viewController?.displayOrder(viewModel: viewModel)
    }
}
