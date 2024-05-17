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
}

// MARK: - CreateOrderViewController Class
final class CreateOrderViewController: UITableViewController {
    private var interactor: CreateOrderBusinessLogic?
    private var router: (CreateOrderRoutingLogic & CreateOrderDataPassing)?

    // MARK: - Declarations
    
    private typealias Section = Constants.Scenes.CreateOrderConstants.Section

    private typealias DataSource = UITableViewDiffableDataSource<
        Section,
        CreateOrder.FormDataSource
    >

    private typealias Snapshot = NSDiffableDataSourceSnapshot<
        Section,
        CreateOrder.FormDataSource
    >

    private var nextCellIndexPath: IndexPath?

    private var textFields: [CreateOrderTextField] = []

    // MARK: - Table View

    private var dataSource: DataSource!

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
        let nextIndexPath = tableView.nextIndexPath(for: indexPath)
        nextCellIndexPath = nextIndexPath
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? CreateOrderTableViewCell else { return }
        
        let isTextFieldInTextFields = textFields.contains(cell.textField)

        guard !isTextFieldInTextFields else { return }
        
        textFields.append(cell.textField)
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

    // MARK: - Helpers

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
        let isTextFieldsSorted = textFields.isSorted()

        guard !isTextFieldsSorted else { return }

        textFields.sort {
            $0.tag < $1.tag
        }
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
}

extension CreateOrderViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        sortTextFields()
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textField = textField as! CreateOrderTextField
        handleKeyboardResponder(for: textField)
        return true
    }
}

// MARK: - Configuration
extension CreateOrderViewController {
    func configureUI() {
        configureTableViewSection()
        configureTableViewCellRegistration()
        configureTableViewDataSource()
    }

    func configureTableViewSection() {
        tableView.sectionHeaderTopPadding = 0
    }

    func configureTableViewCellRegistration() {
        tableView.register(CreateOrderTableViewCell.self, forCellReuseIdentifier: CreateOrderTableViewCell.cellId)
    }

    func configureTableViewDataSource() {
        dataSource = DataSource(
            tableView: tableView,
            cellProvider: { (tableView, indexPath, viewModel) -> UITableViewCell? in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CreateOrderTableViewCell.cellId, for: indexPath) as? CreateOrderTableViewCell else {
                    return UITableViewCell()
                }

                cell.configure(for: viewModel, textFieldDelegate: self)

                return cell
            }
        )
    }
}
