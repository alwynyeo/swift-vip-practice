//
//  ListOrderInteractor.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/21/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - ListOrderBusinessLogic Protocol
protocol ListOrderBusinessLogic {
    func getOrders(request: ListOrder.GetOrders.Request)
}

// MARK: - ListOrderDataStore Protocol
protocol ListOrderDataStore {
    //  var name: String { get set }
}

// MARK: - ListOrderInteractor Class
final class ListOrderInteractor {
    // MARK: - Declarations

    var presenter: ListOrderPresentationLogic?

    let worker: ListOrderWorker

    // MARK: - Object Lifecycle

    init() {
        let worker = OrderMockWorker()
        self.worker = ListOrderWorker(worker: worker)
    }

    // MARK: - Helpers

    private func presentGetOrders(orders: [Order]) {
        let response = ListOrder.GetOrders.Response(orders: orders)
        presenter?.presentGetOrders(response: response)
    }

    deinit {
        print("deinit list")
    }
}

// MARK: - ListOrderBusinessLogic Extension
extension ListOrderInteractor: ListOrderBusinessLogic {
    func getOrders(request: ListOrder.GetOrders.Request) {
        do {
            let orders = try worker.getOrders()
            presentGetOrders(orders: orders)
        } catch ListOrderError.unableToGet {
            print("Unable to get orders")
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - ListOrderDataStore Extension
extension ListOrderInteractor: ListOrderDataStore {}
