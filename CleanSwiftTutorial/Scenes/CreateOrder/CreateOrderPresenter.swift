//
//  CreateOrderPresenter.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 4/7/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - CreateOrderPresentationLogic Protocol
protocol CreateOrderPresentationLogic {
    func presentSomething(response: CreateOrder.Something.Response)
}

// MARK: - CreateOrderPresenter Class
final class CreateOrderPresenter {
    weak var viewController: CreateOrderDisplayLogic?
}

// MARK: - CreateOrderPresentationLogic Extension
extension CreateOrderPresenter: CreateOrderPresentationLogic {
    func presentSomething(response: CreateOrder.Something.Response) {
        let viewModel = CreateOrder.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
