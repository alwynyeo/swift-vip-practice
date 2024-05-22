//
//  CreateOrderInteractor.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 4/7/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - CreateOrderBusinessLogic Protocol
protocol CreateOrderBusinessLogic {
    var shippingMethods: [String] { get }

    func generateForms(request: CreateOrder.GenerateForm.Request)
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

    let worker: CreateOrderWorker

    var shippingMethods: [String] {
        [
            Order.ShipmentMethod(speed: .standard).title,
            Order.ShipmentMethod(speed: .oneDay).title,
            Order.ShipmentMethod(speed: .twoDay).title,
        ]
    }

    // MARK: - Object Lifecycle

    init() {
        let worker = CreateOrderWorker()
        self.worker = worker
    }

    // MARK: - Helpers

    private func handleGenerateForms() {
        let generateCreateOrderFormWorker = worker.generateCreateOrderFormWorker
        let forms = generateCreateOrderFormWorker.generate()
        presentGeneratedForms(forms: forms)
    }

    private func presentGeneratedForms(forms: [[CreateOrder.GenerateForm.Form]]) {
        let response = CreateOrder.GenerateForm.Response(forms: forms)
        presenter?.presentGeneratedForms(response: response)
    }

    private func handleFormatExpirationDate(request: CreateOrder.FormatExpirationDate.Request) {
        let date = request.date
        presentExpirationDate(date: date)
    }

    private func presentExpirationDate(date: Date) {
        let response = CreateOrder.FormatExpirationDate.Response(date: date)
        presenter?.presentExpirationDate(response: response)
    }
}

// MARK: - CreateOrderBusinessLogic Extension
extension CreateOrderInteractor: CreateOrderBusinessLogic {
    func generateForms(request: CreateOrder.GenerateForm.Request) {
        handleGenerateForms()
    }

    func formatExpirationDate(request: CreateOrder.FormatExpirationDate.Request) {
        handleFormatExpirationDate(request: request)
    }
}

// MARK: - CreateOrderDataStore Extension
extension CreateOrderInteractor: CreateOrderDataStore {}
