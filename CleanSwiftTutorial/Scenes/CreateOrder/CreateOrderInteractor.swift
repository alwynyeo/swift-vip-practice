//
//  CreateOrderInteractor.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 4/7/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - CreateOrderBusinessLogic Protocol
protocol CreateOrderBusinessLogic {
    func doSomething(request: CreateOrder.Something.Request)
}

// MARK: - CreateOrderDataStore Protocol
protocol CreateOrderDataStore {
    //  var name: String { get set }
}

// MARK: - CreateOrderInteractor Class
final class CreateOrderInteractor {
    var presenter: CreateOrderPresentationLogic?
    var worker: CreateOrderWorker?
    //  var name: String = ""
}

// MARK: - CreateOrderBusinessLogic Extension
extension CreateOrderInteractor: CreateOrderBusinessLogic {
    func doSomething(request: CreateOrder.Something.Request) {
        worker = CreateOrderWorker()
        worker?.doSomeWork()

        let response = CreateOrder.Something.Response()
        presenter?.presentSomething(response: response)
    }
}

// MARK: - CreateOrderDataStore Extension
extension CreateOrderInteractor: CreateOrderDataStore {}
