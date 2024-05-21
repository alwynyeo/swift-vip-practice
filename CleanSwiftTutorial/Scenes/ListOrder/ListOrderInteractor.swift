//
//  ListOrderInteractor.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/21/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - ListOrderBusinessLogic Protocol
protocol ListOrderBusinessLogic {
    func fetchOrders(request: ListOrder.FetchOrder.Request)
}

// MARK: - ListOrderDataStore Protocol
protocol ListOrderDataStore {
    //  var name: String { get set }
}

// MARK: - ListOrderInteractor Class
final class ListOrderInteractor {
    // MARK: - Declarations

    var presenter: ListOrderPresentationLogic?

    var worker: ListOrderWorker?

    // MARK: - Object Lifecycle

    init() {
        let worker = OrderMockWorker()
        self.worker = ListOrderWorker(worker: worker)
    }

    // MARK: - Helpers

    private func presentFetchedOrders(orders: [Order]) {
        let response = ListOrder.FetchOrder.Response(orders: orders)
        presenter?.presentFetchedOrders(response: response)
    }

    deinit {
        print("deinit list")
    }
}

// MARK: - ListOrderBusinessLogic Extension
extension ListOrderInteractor: ListOrderBusinessLogic {
    func fetchOrders(request: ListOrder.FetchOrder.Request) {
        worker?.fetchOrders(completion: { [weak self] result in
            guard let self else { return  }

            switch result {
                case .success(let orders):
                    presentFetchedOrders(orders: orders)
                case .failure(let error):
                    print(error)
            }
        })
    }
}

// MARK: - ListOrderDataStore Extension
extension ListOrderInteractor: ListOrderDataStore {}
