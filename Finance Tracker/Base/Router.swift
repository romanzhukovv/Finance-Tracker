//
//  Router.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import UIKit

protocol RouterProtocol {
    var navigationController: UINavigationController? { get set }
    var configurator: ConfiguratorProtocol? { get set }
    
    func initTransactionsListView()
    func pushNewTransactionView()
    func dismissNewTransactionView()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var configurator: ConfiguratorProtocol?
    
    init(navigationController: UINavigationController, configurator: ConfiguratorProtocol) {
        self.navigationController = navigationController
        self.configurator = configurator
    }
    
    func initTransactionsListView() {
        if let navigationController = navigationController {
            guard let initialViewController = configurator?.createTransactionListModule(router: self) else { return }
            navigationController.viewControllers = [initialViewController]
        }
    }
    
    func pushNewTransactionView() {
        if let navigationController = navigationController {
            guard let newTransactionView = configurator?.createNewTransactionModule(router: self) else { return }
            newTransactionView.title = "New Transaction"
            newTransactionView.navigationItem.largeTitleDisplayMode = .never
            navigationController.pushViewController(newTransactionView, animated: true)
        }
    }
    
    func dismissNewTransactionView() {
        if let navigationController = navigationController {
            navigationController.dismiss(animated: true)
        }
    }
    
    
}
