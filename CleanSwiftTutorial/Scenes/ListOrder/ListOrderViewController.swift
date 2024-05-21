//
//  ListOrderViewController.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/21/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - ListOrderDisplayLogic Protocol
protocol ListOrderDisplayLogic: AnyObject {
    func displaySomething(viewModel: ListOrder.Something.ViewModel)
}

// MARK: - ListOrderViewController Class
final class ListOrderViewController: UITableViewController {
    // MARK: - Declarations
    
    private var interactor: ListOrderBusinessLogic?

    private var router: (ListOrderRoutingLogic & ListOrderDataPassing)?

    // MARK: - Object Lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    // MARK: - View Lifecycle

    override func loadView() {
        super.loadView()
        configureUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchOrders()
    }

    // MARK: - Override Parent Methods

    // MARK: - Setup

    private func setUp() {
        let viewController = self
        let interactor = ListOrderInteractor()
        let presenter = ListOrderPresenter()
        let router = ListOrderRouter()

        viewController.interactor = interactor
        viewController.router = router

        interactor.presenter = presenter
        presenter.viewController = viewController

        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: - Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let scene = segue.identifier {
//            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
//            if let router = router, router.responds(to: selector) {
//                router.perform(selector, with: segue)
//            }
//        }
    }

    // MARK: - Interactor Logic

    private func fetchOrders() {
        let request = ListOrder.FetchOrder.Request()
        interactor?.fetchOrders(request: request)
    }

    // MARK: - Helpers
}

// MARK: - ListOrderDisplayLogic Extension
extension ListOrderViewController: ListOrderDisplayLogic {
    func displaySomething(viewModel: ListOrder.Something.ViewModel) {}
}
