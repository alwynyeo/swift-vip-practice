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
    func presentSomething(response: CreateOrder.Something.Response)
    func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response)
}

// MARK: - CreateOrderPresenter Class
final class CreateOrderPresenter {
    // MARK: - Declarations

    weak var viewController: CreateOrderDisplayLogic?

    private var dateFormatter: DateFormatter?

    // MARK: - Initialization

    init() {
        dateFormatter = DateFormatter()
        dateFormatter?.dateStyle = .short
        dateFormatter?.timeStyle = .none
    }
}

// MARK: - CreateOrderPresentationLogic Extension
extension CreateOrderPresenter: CreateOrderPresentationLogic {
    func presentSomething(response: CreateOrder.Something.Response) {
        let viewModel = CreateOrder.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }

    func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response) {
        let date = response.date

        guard let dateString = dateFormatter?.string(from: date) else { return }

        let viewModel = CreateOrder.FormatExpirationDate.ViewModel(dateString: dateString)
        
        viewController?.displayExpirationDate(viewModel: viewModel)
    }
}
