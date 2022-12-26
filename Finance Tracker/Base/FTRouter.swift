//
//  Router.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import UIKit

protocol FTRouterProtocol {
    var navigationController: UINavigationController? { get set }
    var configurator: FTConfiguratorProtocol? { get set }
    
    func initTransactionsListView()
    func pushNewTransactionView(viewModel: NewTransactionViewModel)
    func popNewTransactionView()
}

class FTRouter: FTRouterProtocol {
    var navigationController: UINavigationController?
    var configurator: FTConfiguratorProtocol?
    
    init(navigationController: UINavigationController, configurator: FTConfiguratorProtocol) {
        self.navigationController = navigationController
        self.configurator = configurator
    }
    
    func initTransactionsListView() {
        if let navigationController = navigationController {
            guard let initialViewController = configurator?.createTransactionListModule(router: self) else { return }
            initialViewController.title = "Transactions"
            navigationController.viewControllers = [initialViewController]
        }
    }
    
    func pushNewTransactionView(viewModel: NewTransactionViewModel) {
        if let navigationController = navigationController {
            guard let newTransactionView = configurator?.createNewTransactionModule(router: self, viewModel: viewModel) else { return }
            newTransactionView.title = "New Transaction"
            newTransactionView.navigationItem.largeTitleDisplayMode = .never
            navigationController.pushViewController(newTransactionView, animated: true)
        }
    }
    
    func popNewTransactionView() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    
}
