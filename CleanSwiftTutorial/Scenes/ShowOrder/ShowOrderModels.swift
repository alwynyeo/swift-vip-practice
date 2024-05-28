//
//  ShowOrderModels.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/24/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - ShowOrder Enum
enum ShowOrder {
    enum GetOrder {
        struct Request {}
        
        struct Response {
            let order: Order
        }
        
        struct ViewModel {
            struct Order: Hashable {
                let createdDate: String
                let totalPrice: String
                let orderId: String
                let fullName: String
                let email: String
            }

            let order: Order
        }
    }
}
