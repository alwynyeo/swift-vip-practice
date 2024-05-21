//
//  Order.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/21/24.
//

import Foundation

struct Order {
    // MARK: - Miscellaneous

    let id: String

    let totalPrice: Decimal

    let createdDate: Date

    // MARK: - Contact Info

    let contactInformation: ContactInformation

    // MARK: - Shipment Address

    let shipmentAddress: Address

    // MARK: - Shipment Method

    let shipmentMethod: ShipmentMethod

    // MARK: - Payment Information

    let paymentInformation: PaymentInformation

    // MARK: - Billing Address

    let billingAddress: Address
}

extension Order: Equatable {
    static func == (lhs: Order, rhs: Order) -> Bool {
        lhs.id == rhs.id
    }
}

extension Order {
    struct ContactInformation {
        let firstName: String
        let lastName: String
        let phoneNumber: String
        let email: String
    }

    struct PaymentInformation {
        let creditCardNumber: String
        let expirationDate: Date
        let cvv: String
    }

    struct Address {
        let street1: String
        var street2: String?
        let city: String
        let state: String
        let zip: String
    }


    struct ShipmentMethod {
        enum ShippingSpeed: Int {
            case standard = 0 // Standard Shipping
            case oneDay = 1 // One-Day Shipping
            case twoDay = 2 // Two-Day Shipping
        }

        let speed: ShippingSpeed

        var title: String {
            switch speed {
                case .standard: "Standard Shipping"
                case .oneDay: "One Day Shipping"
                case .twoDay: "Two Day Shipping"
            }
        }
    }
}
