//
//  CreateOrderViewController+UI.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/20/24.
//

// MARK: - Programmatic UI Configuration
extension CreateOrderViewController {
    func configureUI() {
        configureNavigationBar()
        configureTableView()
    }

    func configureNavigationBar() {
        navigationItem.title = "Create Order"
    }

    func configureTableView() {
        tableView.sectionHeaderTopPadding = 0
        tableView.register(CreateOrderTableViewCell.self, forCellReuseIdentifier: CreateOrderTableViewCell.cellId)
    }
}
