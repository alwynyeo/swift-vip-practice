//
//  CreateOrderTableViewCell.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/14/24.
//

import UIKit

final class CreateOrderTableViewCell: UITableViewCell {
    // MARK: - Declarations

    static let cellId = "CreateOrderTableViewCell"

    private weak var datePickerDelegate: DatePickerDelegate?

    private(set) var viewModel: CreateOrder.FormDataSource? {
        didSet { configureData() }
    }

    private let titleLabel = UILabel()
    let textField = CreateOrderTextField()
    private let switchToggle = UISwitch()
    private let datePicker = UIDatePicker()
    private let pickerView = UIPickerView()
    private let stackView = UIStackView()

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
        for viewModel: CreateOrder.FormDataSource,
        textFieldDelegate: UITextFieldDelegate,
        pickerViewDelegate: UIPickerViewDelegate,
        datePickerDelegate: DatePickerDelegate
    ) {
        self.viewModel = viewModel
        textField.delegate = textFieldDelegate
        pickerView.delegate = pickerViewDelegate
        self.datePickerDelegate = datePickerDelegate
    }

    private func configureData() {
        guard let viewModel = viewModel else { return }

        let title = viewModel.title
        let inputType = viewModel.inputType

        titleLabel.text = title

        if let textFieldInputTag = viewModel.inputTag {
            textField.tag = textFieldInputTag
        }

        setInputComponentVisibility(for: inputType)
    }

    private func setInputComponentVisibility(for inputType: CreateOrder.FormDataSource.InputType) {
        switch inputType {
            case .textField:
                textField.isHidden = false
                switchToggle.isHidden = true
                datePicker.isHidden = true
                textField.inputView = nil
            case .switchToggle:
                textField.isHidden = true
                switchToggle.isHidden = false
                datePicker.isHidden = true
                textField.inputView = nil
            case .datePicker:
                textField.isHidden = true
                switchToggle.isHidden = true
                datePicker.isHidden = false
                textField.inputView = nil
            case .pickerView:
                textField.isHidden = false
                switchToggle.isHidden = true
                datePicker.isHidden = true
                textField.inputView = pickerView
        }
    }

    @objc private func handleDatePickerValueChanged(_ sender: UIDatePicker) {
        datePickerDelegate?.datePickerValueChanged(sender)
    }
}

// MARK: - UI Configuration (UI Creation)
private extension CreateOrderTableViewCell {
    func configureUI() {
        configureCellStyle()
        configureTitleLabel()
        configureDatePicker()
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

    func configureDatePicker() {
        let today = Date()
        datePicker.datePickerMode = .date
        datePicker.minimumDate = today

        datePicker.addTarget(self, action: #selector(handleDatePickerValueChanged(_:)), for: .valueChanged)
    }

    func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(switchToggle)
        stackView.addArrangedSubview(datePicker)

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
