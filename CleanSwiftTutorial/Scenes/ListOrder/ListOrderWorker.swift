//
//  ListOrderWorker.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/21/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

enum ListOrderError: Error {
    case unableToGet
}

protocol ListOrderWorkerProtocol {
    func getOrders() throws -> [Order]
}

// MARK: - ListOrderWorker Class
final class ListOrderWorker {
    private let worker: ListOrderWorkerProtocol

    init(worker: ListOrderWorkerProtocol) {
        self.worker = worker
    }

    func getOrders() throws -> [Order] {
        do {
            let orders = try worker.getOrders()
            return orders
        } catch ListOrderError.unableToGet {
            throw ListOrderError.unableToGet
        } catch {
            throw error
        }
    }
}
