//
//  CreateOrderWorker.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 4/7/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol GenerateCreateOrderFormProtocol {
    func generate() -> [[CreateOrder.GenerateForm.Form]]
}

// MARK: - CreateOrderWorker Class
final class CreateOrderWorker {

    let generateCreateOrderFormWorker: GenerateCreateOrderFormProtocol

    init() {
        generateCreateOrderFormWorker = GenerateCreateOrderFormWorker()
    }

    func generate() -> [[CreateOrder.GenerateForm.Form]] {
        let forms = generateCreateOrderFormWorker.generate()
        return forms
    }
}
