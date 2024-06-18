//
//  ShowOrderRouter.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/24/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - ShowOrderRoutingLogic Protocol
protocol ShowOrderRoutingLogic {
    func routeToEditOrder()
}

// MARK: - ShowOrderDataPassing Protocol
protocol ShowOrderDataPassing {
    var dataStore: ShowOrderDataStore? { get }
}

// MARK: - ShowOrderRouter Class
final class ShowOrderRouter {
    // MARK: - Declarations
    
    weak var viewController: ShowOrderViewController?
    
    var dataStore: ShowOrderDataStore?

    // MARK: - Passing Data

    private func passDataToEditOrder(source: ShowOrderDataStore, destination: inout CreateOrderDataStore) {
        destination.existingOrder = source.order
    }

    // MARK: - Navigation

    private func navigateToEditOrder(source: ShowOrderViewController, destination: CreateOrderViewController) {
        source.show(destination, sender: nil)
    }
}

// MARK: - ShowOrderRoutingLogic Extension
extension ShowOrderRouter: ShowOrderRoutingLogic {
    func routeToEditOrder() {
        let destinationViewController = CreateOrderViewController(nibName: nil, bundle: nil)
        var destinationDataStore = destinationViewController.router!.dataStore!
        passDataToEditOrder(source: dataStore!, destination: &destinationDataStore)
        navigateToEditOrder(source: viewController!, destination: destinationViewController)
    }
}

// MARK: - ShowOrderDataPassing Extension
extension ShowOrderRouter: ShowOrderDataPassing {}
