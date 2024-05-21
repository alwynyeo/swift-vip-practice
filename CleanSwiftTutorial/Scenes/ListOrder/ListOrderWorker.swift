//
//  ListOrderWorker.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/21/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

enum ListOrderError: Error {}

protocol ListOrderWorkerProtocol {
    func fetchOrders(completion: @escaping(Result<[Order], ListOrderError>) -> Void)
}

// MARK: - ListOrderWorker Class
final class ListOrderWorker {
    private let worker: ListOrderWorkerProtocol

    init(worker: ListOrderWorkerProtocol) {
        self.worker = worker
    }

    func fetchOrders(completion: @escaping (Result<[Order], ListOrderError>) -> Void) {
        worker.fetchOrders { [weak self] result in
            guard let _ = self else { return }

            switch result {
                case .success(let orders):
                    completion(.success(orders))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
