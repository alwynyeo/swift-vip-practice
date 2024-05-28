//
//  ListOrderRouter.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/21/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - ListOrderRoutingLogic Protocol
protocol ListOrderRoutingLogic {
    func routeToCreateOrder()
    func routeToShowOrder()
}

// MARK: - ListOrderDataPassing Protocol
protocol ListOrderDataPassing {
    var dataStore: ListOrderDataStore? { get }
}

// MARK: - ListOrderRouter Class
final class ListOrderRouter {
    // MARK: - Declarations
    
    weak var viewController: ListOrderViewController?
    
    var dataStore: ListOrderDataStore?

    // MARK: - Passing Data

    func passDataToCreateOrder(source: ListOrderDataStore, destination: inout CreateOrderDataStore) {}

    func passDataToShowOrder(source: ListOrderDataStore, destination: inout ShowOrderDataStore) {
        guard let selectedRow = viewController?.tableView.indexPathForSelectedRow?.row else { return }
        let selectedOrder = source.orders[selectedRow]
        destination.order = selectedOrder
    }

    // MARK: - Navigation

    func navigateToCreateOrder(source: ListOrderViewController, destination: CreateOrderViewController) {
        source.show(destination, sender: nil)
    }

    func navigateToShowOrder(source: ListOrderViewController, destination: ShowOrderViewController) {
        source.show(destination, sender: nil)
    }
}

// MARK: - ListOrderRoutingLogic Extension
extension ListOrderRouter: ListOrderRoutingLogic {
    func routeToCreateOrder() {
        let destinationViewController = CreateOrderViewController(nibName: nil, bundle: nil)
        var destinationDataStore = destinationViewController.router!.dataStore!
        passDataToCreateOrder(source: dataStore!, destination: &destinationDataStore)
        navigateToCreateOrder(source: viewController!, destination: destinationViewController)
    }

    func routeToShowOrder() {
        let destinationViewController = ShowOrderViewController(nibName: nil, bundle: nil)
        var destinationDataStore = destinationViewController.router!.dataStore!
        passDataToShowOrder(source: dataStore!, destination: &destinationDataStore)
        navigateToShowOrder(source: viewController!, destination: destinationViewController)
    }
}

// MARK: - ListOrderDataPassing Extension
extension ListOrderRouter: ListOrderDataPassing {}
