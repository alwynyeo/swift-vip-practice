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
    func displayFetchedOrders(viewModel: ListOrder.FetchOrder.ViewModel)
}

// MARK: - ListOrderViewController Class
final class ListOrderViewController: UITableViewController {
    // MARK: - Declarations

    private var interactor: ListOrderBusinessLogic?

    private var router: (ListOrderRoutingLogic & ListOrderDataPassing)?

    private enum Section: CaseIterable {
        case main
    }

    private typealias DataSource = UITableViewDiffableDataSource<
        Section,
        ListOrder.FetchOrder.ViewModel.Order
    >

    private lazy var dataSource = makeDataSource()

    // MARK: - Object Lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    deinit {
        print("Deinit - ListOrderViewController")
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        print(item.totalPrice)
    }

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

    private func makeDataSource() -> DataSource {
        DataSource(
            tableView: tableView,
            cellProvider: { [weak self] (tableView, indexPath, viewModel) -> UITableViewCell? in
                let defaultCell = UITableViewCell()

                let _ = self

                guard let cell = tableView.dequeueReusableCell(withIdentifier: ListOrderTableViewCell.cellId, for: indexPath) as? ListOrderTableViewCell else {
                    return defaultCell
                }

                cell.configure(for: viewModel)

                return cell
            }
        )
    }

    private func updateFetchedOrders(orders: [ListOrder.FetchOrder.ViewModel.Order]) {
        var snapshot = dataSource.snapshot()

        snapshot.appendSections(Section.allCases)

        snapshot.appendItems(orders, toSection: .main)

        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - ListOrderDisplayLogic Extension
extension ListOrderViewController: ListOrderDisplayLogic {
    func displayFetchedOrders(viewModel: ListOrder.FetchOrder.ViewModel) {
        let orders = viewModel.orders
        updateFetchedOrders(orders: orders)
    }
}
