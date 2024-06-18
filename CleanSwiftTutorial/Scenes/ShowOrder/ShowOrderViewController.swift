//
//  ShowOrderViewController.swift
//  CleanSwiftTutorial
//
//  Created by Alwyn Yeo on 5/24/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - ShowOrderDisplayLogic Protocol
protocol ShowOrderDisplayLogic: AnyObject {
    func displayOrder(viewModel: ShowOrder.GetOrder.ViewModel)
}

// MARK: - ShowOrderViewController Class
final class ShowOrderViewController: UIViewController {
    // MARK: - Declarations
    
    private var interactor: ShowOrderBusinessLogic?

    var router: (ShowOrderRoutingLogic & ShowOrderDataPassing)?

    private let orderIdTitleLabel = UILabel()

    private let orderDateTitleLabel = UILabel()

    private let emailAddressTitleLabel = UILabel()

    private let yourNameTitleLabel = UILabel()

    private let orderTotalTitleLabel = UILabel()

    private let orderIdLabel = UILabel()

    private let orderDateLabel = UILabel()

    private let emailAddressLabel = UILabel()

    private let yourNameLabel = UILabel()

    private let orderTotalLabel = UILabel()

    // MARK: - Object Lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

    deinit {
        print("Deinit ShowOrderViewController")
    }

    // MARK: - View Lifecycle

    override func loadView() {
        super.loadView()
        configureUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getOrder()
    }

    // MARK: - Override Parent Methods

    // MARK: - Setup

    private func setUp() {
        let viewController = self
        let interactor = ShowOrderInteractor()
        let presenter = ShowOrderPresenter()
        let router = ShowOrderRouter()

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

    private func getOrder() {
        let request = ShowOrder.GetOrder.Request()
        interactor?.getOrder(request: request)
    }

    // MARK: - Helpers
}

// MARK: - ShowOrderDisplayLogic Extension
extension ShowOrderViewController: ShowOrderDisplayLogic {
    func displayOrder(viewModel: ShowOrder.GetOrder.ViewModel) {
        let order = viewModel.order

        let orderId = order.orderId

        let createdDate = order.createdDate

        let email = order.email

        let fullName = order.fullName

        let totalPrice = order.totalPrice

        orderIdLabel.text = orderId
        orderDateLabel.text = createdDate
        emailAddressLabel.text = email
        yourNameLabel.text = fullName
        orderTotalLabel.text = totalPrice
    }
}

// MARK: - Programmatic UI Configuration
private extension ShowOrderViewController {
    func configureUI() {
        view.backgroundColor = .white

        let titleStackView = UIStackView()
        titleStackView.axis = .vertical
        titleStackView.distribution = .fill
        titleStackView.alignment = .fill
        titleStackView.spacing = 8

        orderIdTitleLabel.text = "Order ID: "
        orderDateTitleLabel.text = "Order Date: "
        emailAddressTitleLabel.text = "Email Address: "
        yourNameTitleLabel.text = "Your Name: "
        orderTotalTitleLabel.text = "Order Total: "

        titleStackView.addArrangedSubview(orderIdTitleLabel)
        titleStackView.addArrangedSubview(orderDateTitleLabel)
        titleStackView.addArrangedSubview(emailAddressTitleLabel)
        titleStackView.addArrangedSubview(yourNameTitleLabel)
        titleStackView.addArrangedSubview(orderTotalTitleLabel)

        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.distribution = .fill
        contentStackView.alignment = .fill
        contentStackView.spacing = 8

        orderDateLabel.numberOfLines = 0

        orderIdLabel.text = "1234"
        orderDateLabel.text = "5/6/2024"
        emailAddressLabel.text = "Email address"
        yourNameLabel.text = "Your name"
        orderTotalLabel.text = "Order total"

        contentStackView.addArrangedSubview(orderIdLabel)
        contentStackView.addArrangedSubview(orderDateLabel)
        contentStackView.addArrangedSubview(emailAddressLabel)
        contentStackView.addArrangedSubview(yourNameLabel)
        contentStackView.addArrangedSubview(orderTotalLabel)

        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fill
        mainStackView.alignment = .top
        mainStackView.spacing = 8

        mainStackView.addArrangedSubview(titleStackView)
        mainStackView.addArrangedSubview(contentStackView)

        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(mainStackView)

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
        ])

        let primaryAction = UIAction(
            handler: { [weak self] action in
                guard let self else { return }
                router?.routeToEditOrder()
            }
        )

        let rightBarButtonItemTitle = "Edit Order"

        let rightBarButtonItem = UIBarButtonItem(
            title: rightBarButtonItemTitle,
            primaryAction: primaryAction
        )

        navigationItem.title = "Show Order"
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}
