//
//  Configurator.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import UIKit

protocol ConfiguratorProtocol {
    func createTransactionListModule(router: RouterProtocol) -> UIViewController
    func createNewTransactionModule(router: RouterProtocol) -> UIViewController
}

final class Configurator: ConfiguratorProtocol {
    func createTransactionListModule(router: RouterProtocol) -> UIViewController {
        let transactions: [Transaction] = []
        let view = TransactionsViewController()
        let viewModel = TransactionsViewModel()
        viewModel.transactions = transactions
        viewModel.router = router
        view.viewModel = viewModel
        view.rootView.viewModel = viewModel
        return view
    }
    
    func createNewTransactionModule(router: RouterProtocol) -> UIViewController {
        let view = NewTransactionViewController()
        let viewModel = NewTransactionViewModel()
        viewModel.router = router
        view.viewModel = viewModel
        return view
    }
}
