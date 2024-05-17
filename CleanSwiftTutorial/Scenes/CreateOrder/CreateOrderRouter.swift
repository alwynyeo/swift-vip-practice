//
//  CreateOrderRouter.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 4/7/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - CreateOrderRoutingLogic Protocol
protocol CreateOrderRoutingLogic {
    //  func routeToSomewhere(segue: UIStoryboardSegue?)
}

// MARK: - CreateOrderDataPassing Protocol
protocol CreateOrderDataPassing {
    var dataStore: CreateOrderDataStore? { get }
}

// MARK: - CreateOrderRouter Class
final class CreateOrderRouter {
    weak var viewController: CreateOrderViewController?
    var dataStore: CreateOrderDataStore?

    // MARK: - Navigation

//    func navigateToSomewhere(source: CreateOrderViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    // MARK: - Passing Data

//    func passDataToSomewhere(source: CreateOrderDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}

// MARK: - CreateOrderRoutingLogic Extension
extension CreateOrderRouter: CreateOrderRoutingLogic {
//    func routeToSomewhere(segue: UIStoryboardSegue?) {
//        if let segue = segue {
//            let destinationVC = segue.destination as! SomewhereViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//        } else {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//            navigateToSomewhere(source: viewController!, destination: destinationVC)
//        }
//    }
}

// MARK: - CreateOrderDataPassing Extension
extension CreateOrderRouter: CreateOrderDataPassing {}
