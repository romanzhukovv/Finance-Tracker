//
//  Configurator.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import UIKit

protocol FTConfiguratorProtocol {
    func createTransactionListModule(router: FTRouterProtocol) -> UIViewController
    func createNewTransactionModule(router: FTRouterProtocol, viewModel: NewTransactionViewModelProtocol) -> UIViewController
}

final class FTConfigurator: FTConfiguratorProtocol {
    
    func createTransactionListModule(router: FTRouterProtocol) -> UIViewController {
        let transactions: [Transaction] = []
        let view = TransactionsViewController()
        let viewModel = TransactionsViewModel()
        viewModel.transactions = transactions
        viewModel.router = router
        view.viewModel = viewModel
        view.rootView.viewModel = viewModel
        return view
    }
    
    func createNewTransactionModule(router: FTRouterProtocol, viewModel: NewTransactionViewModelProtocol) -> UIViewController {
        let view = NewTransactionViewController()
        viewModel.router = router
        view.viewModel = viewModel
        view.rootView.viewModel = viewModel
        return view
    }
}
