//
//  ListOrderRouter.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/21/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - ListOrderRoutingLogic Protocol
protocol ListOrderRoutingLogic {
    //  func routeToSomewhere(segue: UIStoryboardSegue?)
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

    // MARK: - Navigation

//    func navigateToSomewhere(source: ListOrderViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    // MARK: - Passing Data

//    func passDataToSomewhere(source: ListOrderDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}

// MARK: - ListOrderRoutingLogic Extension
extension ListOrderRouter: ListOrderRoutingLogic {
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

// MARK: - ListOrderDataPassing Extension
extension ListOrderRouter: ListOrderDataPassing {}
