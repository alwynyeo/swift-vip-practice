//
//  OrderMockWorker.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/22/24.
//

import Foundation

private typealias OrderMockWorkerProtocol = ListOrderWorkerProtocol

final class OrderMockWorker: OrderMockWorkerProtocol {

    // MARK: - Mock Data

    private let today: Date = Date()

    private let contactInformation1: Order.ContactInformation = Order.ContactInformation(
        firstName: "John",
        lastName: "Doe",
        phoneNumber: "0123456789",
        email: "johndoe@test.com"
    )

    private let contactInformation2: Order.ContactInformation = Order.ContactInformation(
        firstName: "Jane",
        lastName: "Doe",
        phoneNumber: "0123456788",
        email: "janedoe@test.com"
    )

    private let shipmentAddress1: Order.Address = Order.Address(
        street1: "Shipping Address Test 1",
        city: "Petaling Jaya",
        state: "Selangor",
        zip: "87000"
    )

    private let shipmentAddress2: Order.Address = Order.Address(
        street1: "Shipping Address Test 2",
        city: "Penampang",
        state: "Kota Kinabalu",
        zip: "87007"
    )

    private let shipmentMethod1: Order.ShipmentMethod = Order.ShipmentMethod(speed: .oneDay)

    private let shipmentMethod2: Order.ShipmentMethod = Order.ShipmentMethod(speed: .standard)

    private lazy var paymentInformation1: Order.PaymentInformation = Order.PaymentInformation(
        creditCardNumber: "4111 1111 1111 1111",
        expirationDate: today,
        cvv: "012"
    )

    private lazy var paymentInformation2: Order.PaymentInformation = Order.PaymentInformation(
        creditCardNumber: "4222 2222 2222 2222",
        expirationDate: today,
        cvv: "123"
    )

    private let billingAddress1: Order.Address = Order.Address(
        street1: "Billing Address Test 1",
        city: "Petaling Jaya",
        state: "Selangor",
        zip: "87000"
    )

    private let billingAddress2: Order.Address = Order.Address(
        street1: "Billing Address Test 2",
        city: "Penampang",
        state: "Kota Kinabalu",
        zip: "87007"
    )

    private lazy var orders: [Order] = [
        Order(
            id: "orderMockId1",
            totalPrice: 69.90,
            createdDate: today,
            contactInformation: contactInformation1,
            shipmentAddress: shipmentAddress1,
            shipmentMethod: shipmentMethod1,
            paymentInformation: paymentInformation1,
            billingAddress: billingAddress1
        ),
        Order(
            id: "orderMockId2",
            totalPrice: 99.90,
            createdDate: today,
            contactInformation: contactInformation2,
            shipmentAddress: shipmentAddress2,
            shipmentMethod: shipmentMethod2,
            paymentInformation: paymentInformation2,
            billingAddress: billingAddress2
        ),
    ]

    // MARK: - CRUD Operations

    func fetchOrders(completion: @escaping (Result<[Order], ListOrderError>) -> Void) {
        let orders: [Order] = orders
        completion(.success(orders))
    }
}
