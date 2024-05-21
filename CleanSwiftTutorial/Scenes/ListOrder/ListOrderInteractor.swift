//
//  ListOrderInteractor.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/21/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - ListOrderBusinessLogic Protocol
protocol ListOrderBusinessLogic {
    func doSomething(request: ListOrder.Something.Request)
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
    //  var name: String = ""

    // MARK: - Object Lifecycle

    init() {}
}

// MARK: - ListOrderBusinessLogic Extension
extension ListOrderInteractor: ListOrderBusinessLogic {
    func doSomething(request: ListOrder.Something.Request) {
        worker = ListOrderWorker()
        worker?.doSomeWork()
        
        let response = ListOrder.Something.Response()
        presenter?.presentSomething(response: response)
    }
}

// MARK: - ListOrderDataStore Extension
extension ListOrderInteractor: ListOrderDataStore {}
