//
//  CreateOrderWorker.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 4/7/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol GenerateCreateOrderFormProtocol {
    func generateForms() -> [[CreateOrder.GenerateForm.Form]]
}

// MARK: - CreateOrderWorker Class
final class CreateOrderWorker {
    // MARK: - Declarations

    private let generateCreateOrderFormWorker: GenerateCreateOrderFormProtocol

    // MARK: - Object Lifecycle

    init() {
        generateCreateOrderFormWorker = GenerateCreateOrderFormWorker()
    }

    // MARK: - Helpers

    func generateForms() -> [[CreateOrder.GenerateForm.Form]] {
        let forms = generateCreateOrderFormWorker.generateForms()
        return forms
    }
}
