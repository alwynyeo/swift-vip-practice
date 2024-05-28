//
//  ShowOrderInteractor.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/24/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - ShowOrderBusinessLogic Protocol
protocol ShowOrderBusinessLogic {
    func getOrder(request: ShowOrder.GetOrder.Request)
}

// MARK: - ShowOrderDataStore Protocol
protocol ShowOrderDataStore {
    var order: Order? { get set }
}

// MARK: - ShowOrderInteractor Class
final class ShowOrderInteractor {
    // MARK: - Declarations

    var presenter: ShowOrderPresentationLogic?
    
    let worker: ShowOrderWorker

    var order: Order?

    // MARK: - Object Lifecycle

    init() {
        self.worker = ShowOrderWorker()
    }
}

// MARK: - ShowOrderBusinessLogic Extension
extension ShowOrderInteractor: ShowOrderBusinessLogic {
    func getOrder(request: ShowOrder.GetOrder.Request) {
        guard let order = order else { return }

        let response = ShowOrder.GetOrder.Response(order: order)

        presenter?.presentOrder(response: response)
    }
}

// MARK: - ShowOrderDataStore Extension
extension ShowOrderInteractor: ShowOrderDataStore {}
