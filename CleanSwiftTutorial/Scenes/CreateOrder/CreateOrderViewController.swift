//
//  CreateOrderViewController.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 4/7/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - CreateOrderDisplayLogic Protocol
protocol CreateOrderDisplayLogic: AnyObject {
    func displaySomething(viewModel: CreateOrder.Something.ViewModel)
    func displayExpirationDate(viewModel: CreateOrder.FormatExpirationDate.ViewModel)
}

// MARK: - CreateOrderViewController Class
final class CreateOrderViewController: UITableViewController {
    // MARK: - Declarations

    private var interactor: CreateOrderBusinessLogic?

    private var router: (CreateOrderRoutingLogic & CreateOrderDataPassing)?
    
    private enum Section: String, CaseIterable {
        case customerContactInfo = "Customer Contact Info"
        case shipmentAddress = "Shipment Address"
        case shipmentMethod = "Shipment Method"
        case paymentInformation = "Payment Information"
        case billingAddress = "Billing Address"
    }

    private typealias DataSource = UITableViewDiffableDataSource<
        Section,
        CreateOrder.FormDataSource
    >

    private typealias Snapshot = NSDiffableDataSourceSnapshot<
        Section,
        CreateOrder.FormDataSource
    >

    private var textFields: [CreateOrderTextField] = []

    private var pickerViewTextField: UITextField?

    // MARK: - Table View

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

    // MARK: - View Lifecycle

    override func loadView() {
        super.loadView()
        navigationItem.title = "Create Order"
        configureUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableViewData()
        doSomething()
    }

    // MARK: - Override Parent Methods

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        let title = dataSource.sectionIdentifier(for: section)?.rawValue
        label.backgroundColor = .systemGray6
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .label
        label.text = title
        return label
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CreateOrderTableViewCell else { return }

        guard let viewModel = cell.viewModel else { return }

        let inputType = viewModel.inputType

        let isTextFieldInputType = inputType == .textField

        let textField = cell.textField

        guard isTextFieldInputType else { return }

        let isCurrentTextField = textField.isDescendant(of: cell)

        guard isCurrentTextField else { return }

        textField.becomeFirstResponder()
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? CreateOrderTableViewCell else { return }

        guard let viewModel = cell.viewModel else { return }

        let inputType = viewModel.inputType

        let isSwitchToggleInputType = inputType == .switchToggle

        guard !isSwitchToggleInputType else { return }

        let textField = cell.textField

        let isTextFieldInTextFields = textFields.contains(textField)

        guard !isTextFieldInTextFields else { return }

        textFields.append(textField)
    }

    // MARK: - Setup

    private func setUp() {
        let viewController = self
        let interactor = CreateOrderInteractor()
        let presenter = CreateOrderPresenter()
        let router = CreateOrderRouter()

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
        let request = CreateOrder.Something.Request()
        interactor?.doSomething(request: request)
    }

    private func formatExpirationDate(date: Date) {
        let request = CreateOrder.FormatExpirationDate.Request(date: date)
        interactor?.formatExpirationDate(request: request)
    }

    // MARK: - Helpers

    private func makeDataSource() -> DataSource {
        DataSource(
            tableView: tableView,
            cellProvider: { [weak self] (tableView, indexPath, viewModel) -> UITableViewCell? in
                let defaultCell = UITableViewCell()

                guard let self else { return defaultCell }

                guard let cell = tableView.dequeueReusableCell(withIdentifier: CreateOrderTableViewCell.cellId, for: indexPath) as? CreateOrderTableViewCell else {
                    return defaultCell
                }

                cell.configure(
                    for: viewModel,
                    textFieldDelegate: self,
                    pickerViewDelegate: self,
                    datePickerDelegate: self
                )

                return cell
            }
        )
    }

    private func loadTableViewData() {
        var snapshot = Snapshot()

        snapshot.appendSections(Section.allCases)

        snapshot.appendItems(Constants.Scenes.CreateOrderConstants.customerContactInfos, toSection: .customerContactInfo)
        snapshot.appendItems(Constants.Scenes.CreateOrderConstants.shipmentAddresses, toSection: .shipmentAddress)
        snapshot.appendItems(Constants.Scenes.CreateOrderConstants.shipmentMethods, toSection: .shipmentMethod)
        snapshot.appendItems(Constants.Scenes.CreateOrderConstants.paymentInformations, toSection: .paymentInformation)
        snapshot.appendItems(Constants.Scenes.CreateOrderConstants.billingAddresses, toSection: .billingAddress)

        dataSource.apply(snapshot, animatingDifferences: true)
    }

    private func sortTextFields() {

        let isTextFieldsEmpty = textFields.isEmpty

        guard !isTextFieldsEmpty else { return }

        textFields.sort { $0.tag < $1.tag }
    }

    private func handleKeyboardResponder(for textField: CreateOrderTextField) {
        textField.resignFirstResponder()

        if let currentTextField = textFields.firstIndex(of: textField) {
            let lastTextField = textFields.count - 1
            if currentTextField < lastTextField {
                let nextTextField = textFields[currentTextField + 1]
                nextTextField.becomeFirstResponder()
            }
        }
    }
}

// MARK: - CreateOrderDisplayLogic Extension
extension CreateOrderViewController: CreateOrderDisplayLogic {
    func displaySomething(viewModel: CreateOrder.Something.ViewModel) {}

    func displayExpirationDate(viewModel: CreateOrder.FormatExpirationDate.ViewModel) {
        let dateString = viewModel.dateString
        print("Date String::", dateString)
    }
}

// MARK: - UITextFieldDelegate
extension CreateOrderViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        sortTextFields()

        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        let inputView = textField.inputView

        let isPickerView = inputView is UIPickerView

        pickerViewTextField = isPickerView ? textField : nil
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        pickerViewTextField = nil

        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textField = textField as! CreateOrderTextField

        handleKeyboardResponder(for: textField)

        return true
    }
}

// MARK: - UIPickerViewDelegate
extension CreateOrderViewController: UIPickerViewDelegate {}

// MARK: - UIPickerViewDataSource
extension CreateOrderViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        interactor?.shippingMethods.count ?? 0
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        interactor?.shippingMethods[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerViewTextField?.text = interactor?.shippingMethods[row]
    }
}

// MARK: - DatePickerDelegate
extension CreateOrderViewController: DatePickerDelegate {
    func datePickerValueChanged(_ sender: UIDatePicker) {
        let date = sender.date
        formatExpirationDate(date: date)
    }
}
