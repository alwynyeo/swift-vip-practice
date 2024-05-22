//
//  ListOrderViewController+UI.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/21/24.
//

import UIKit

// MARK: - Programmatic UI Configuration
extension ListOrderViewController {
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
        tableView.register(ListOrderTableViewCell.self, forCellReuseIdentifier: ListOrderTableViewCell.cellId)
    }
}
