//
//  ListOrderPresenter.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/21/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - ListOrderPresentationLogic Protocol
protocol ListOrderPresentationLogic {
    func presentSomething(response: ListOrder.Something.Response)
}

// MARK: - ListOrderPresenter Class
final class ListOrderPresenter {
    // MARK: - Declarations

    weak var viewController: ListOrderDisplayLogic?

    // MARK: - Object Lifecycle

    init() {}
}

// MARK: - ListOrderPresentationLogic Extension
extension ListOrderPresenter: ListOrderPresentationLogic {
    func presentSomething(response: ListOrder.Something.Response) {
        let viewModel = ListOrder.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
