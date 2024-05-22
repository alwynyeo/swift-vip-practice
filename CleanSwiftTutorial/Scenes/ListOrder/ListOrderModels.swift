//
//  ListOrderModels.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/21/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - ListOrder Enum
enum ListOrder {
    enum Something {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }

    enum FetchOrder {
        struct Request {}

        struct Response {
            let orders: [Order]
        }

        struct ViewModel {
            struct Order: Hashable {
                let createdDate: String
                let totalPrice: String
                let orderId: String
                let fullName: String
                let email: String
            }

            let orders: [Order]
        }
    }
}
