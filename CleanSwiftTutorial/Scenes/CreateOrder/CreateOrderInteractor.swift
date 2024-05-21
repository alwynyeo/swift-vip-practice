//
//  CreateOrderInteractor.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 4/7/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - CreateOrderBusinessLogic Protocol
protocol CreateOrderBusinessLogic {
    var shippingMethods: [String] { get }

    func doSomething(request: CreateOrder.Something.Request)
    func formatExpirationDate(request: CreateOrder.FormatExpirationDate.Request)
}

// MARK: - CreateOrderDataStore Protocol
protocol CreateOrderDataStore {
    //  var name: String { get set }
}

// MARK: - CreateOrderInteractor Class
final class CreateOrderInteractor {
    // MARK: - Declarations

    var presenter: CreateOrderPresentationLogic?

    var worker: CreateOrderWorker?

    var shippingMethods: [String] {
        [
            Order.ShipmentMethod(speed: .standard).title,
            Order.ShipmentMethod(speed: .oneDay).title,
            Order.ShipmentMethod(speed: .twoDay).title,
        ]
    }
}

// MARK: - CreateOrderBusinessLogic Extension
extension CreateOrderInteractor: CreateOrderBusinessLogic {
    func doSomething(request: CreateOrder.Something.Request) {
        worker = CreateOrderWorker()
        worker?.doSomeWork()

        let response = CreateOrder.Something.Response()
        presenter?.presentSomething(response: response)
    }

    func formatExpirationDate(request: CreateOrder.FormatExpirationDate.Request) {
        let date = request.date
        let response = CreateOrder.FormatExpirationDate.Response(date: date)

        presenter?.presentExpirationDate(response: response)
    }
}

// MARK: - CreateOrderDataStore Extension
extension CreateOrderInteractor: CreateOrderDataStore {}
