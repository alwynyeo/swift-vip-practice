//
//  CreateOrderTableViewCell.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/14/24.
//

import UIKit

final class CreateOrderTableViewCell: UITableViewCell {

    private(set) var viewModel: CreateOrder.FormDataSource? {
        didSet { configureData() }
    }

    // MARK: - Declarations

    static let cellId = "CreateOrderTableViewCell"

    private let titleLabel = UILabel()
    let textField = CreateOrderTextField()
    private let stackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }

    func configure(for viewModel: CreateOrder.FormDataSource, textFieldDelegate: UITextFieldDelegate) {
        self.viewModel = viewModel
        textField.delegate = textFieldDelegate
    }

    private func configureData() {
        guard let viewModel = viewModel else { return }

        let title = viewModel.title
        let inputFieldTag = viewModel.inputFieldTag

        titleLabel.text = title
        textField.tag = inputFieldTag
    }
}

// MARK: - Configuration
private extension CreateOrderTableViewCell {
    func configureUI() {
        configureCellStyle()
        configureTitleLabel()
        configureStackView()
    }

    func configureCellStyle() {
        selectionStyle = .none
    }

    func configureTitleLabel() {
        let defaultPriorityFloat = UILayoutPriority.defaultLow.rawValue // 250.0
        let newPriorityFloat = defaultPriorityFloat + 1.0 // 251.0
        let newPriority = UILayoutPriority(newPriorityFloat)
        titleLabel.setContentHuggingPriority(newPriority, for: .vertical)
        titleLabel.setContentHuggingPriority(newPriority, for: .horizontal)
    }

    func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(textField)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
}
