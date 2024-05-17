//
//  CreateOrderModels.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 4/7/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - CreateOrder Enum
enum CreateOrder {
    enum Something {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }

    struct FormDataSource: Hashable {
        let id: String
        let title: String
        let inputFieldTag: Int

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

        static func == (lhs: FormDataSource, rhs: FormDataSource) -> Bool {
            return lhs.id == rhs.id
        }
    }
}
