//
//  ListOrderPresenter.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/21/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - ListOrderPresentationLogic Protocol
protocol ListOrderPresentationLogic {
    func presentFetchedOrders(response: ListOrder.FetchOrder.Response)
}

// MARK: - ListOrderPresenter Class
final class ListOrderPresenter {
    // MARK: - Declarations

    weak var viewController: ListOrderDisplayLogic?

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

// MARK: - ListOrderPresentationLogic Extension
extension ListOrderPresenter: ListOrderPresentationLogic {
    func presentFetchedOrders(response: ListOrder.FetchOrder.Response) {
        let responseOrders = response.orders

        var orders: [ListOrder.FetchOrder.ViewModel.Order] = []

        responseOrders.forEach {
            let createdDate = $0.createdDate
            let formattedCreatedDate = dateFormatter.string(from: createdDate)

            let totalPrice = $0.totalPrice as NSNumber
            let formattedTotalPrice = currencyFormatter.string(from: totalPrice) ?? ""

            let orderId = $0.id

            let firstName = $0.contactInformation.firstName
            let lastName = $0.contactInformation.lastName
            let fullName = firstName + " " + lastName

            let email = $0.contactInformation.email

            let order = ListOrder.FetchOrder.ViewModel.Order(
                createdDate: formattedCreatedDate,
                totalPrice: formattedTotalPrice,
                orderId: orderId,
                fullName: fullName,
                email: email
            )

            orders.append(order)
        }

        let viewModel = ListOrder.FetchOrder.ViewModel(orders: orders)

        viewController?.displayFetchedOrders(viewModel: viewModel)
    }
}
