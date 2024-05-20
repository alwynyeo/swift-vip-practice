//
//  CreateOrderViewController+UI.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/20/24.
//

// MARK: - Programmatic UI Configuration
extension CreateOrderViewController {
    func configureUI() {
        configureTableViewSection()
        configureTableViewCellRegistration()
    }

    func configureTableViewSection() {
        tableView.sectionHeaderTopPadding = 0
    }

    func configureTableViewCellRegistration() {
        tableView.register(CreateOrderTableViewCell.self, forCellReuseIdentifier: CreateOrderTableViewCell.cellId)
    }
}
