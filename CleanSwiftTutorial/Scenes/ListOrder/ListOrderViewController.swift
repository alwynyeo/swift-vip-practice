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
        doSomething()
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

    private func doSomething() {
        let request = ListOrder.Something.Request()
        interactor?.doSomething(request: request)
    }

    // MARK: - Helpers
}

// MARK: - ListOrderDisplayLogic Extension
extension ListOrderViewController: ListOrderDisplayLogic {
    func displaySomething(viewModel: ListOrder.Something.ViewModel) {}
}

// MARK: - Programmatic UI Configuration
private extension ListOrderViewController {
    func configureUI() {
        configureNavigationBar()
        configureTableView()
    }

    func configureNavigationBar() {
        let primaryAction = UIAction(
            handler: { [weak self] action in
                guard let self else { return }
                let createOrderController = CreateOrderViewController(nibName: nil, bundle: nil)
                navigationController?.pushViewController(createOrderController, animated: true)
            }
        )

        let plusIcon = UIImage(systemName: "plus")

        let rightBarButtonItem = UIBarButtonItem(
            image: plusIcon,
            primaryAction: primaryAction
        )

        navigationItem.title = "List Order"
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    func configureTableView() {
        tableView.backgroundColor = .red
    }
}
