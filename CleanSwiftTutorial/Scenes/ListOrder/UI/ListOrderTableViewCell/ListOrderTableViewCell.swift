//
//  ListOrderTableViewCell.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/23/24.
//

import UIKit

final class ListOrderTableViewCell: UITableViewCell {
    // MARK: - Declarations

    static let cellId = "ListOrderTableViewCell"

    private let dateLabel = UILabel()
    private let totalPriceLabel = UILabel()
    private let stackView = UIStackView()

    private(set) var viewModel: ListOrder.GetOrders.ViewModel.Order? {
        didSet { configureData() }
    }

    // MARK: - Object Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }

    // MARK: - Helpers
    func configure(
        for viewModel: ListOrder.GetOrders.ViewModel.Order
    ) {
        self.viewModel = viewModel
    }

    private func configureData() {
        guard let viewModel = viewModel else { return }

        let date = viewModel.createdDate
        let totalPrice = viewModel.totalPrice

        dateLabel.text = date
        totalPriceLabel.text = totalPrice
    }
}

// MARK: - UI Configuration (UI Creation)
private extension ListOrderTableViewCell {
    func configureUI() {
        configureCellStyle()
        configureStackView()
    }

    func configureCellStyle() {
        selectionStyle = .none
    }

    func configureStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill

        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(totalPriceLabel)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8),
        ])
    }
}
