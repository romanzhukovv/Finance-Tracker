//
//  Configurator.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import UIKit

protocol ConfiguratorProtocol {
    static func createTransactionListModule() -> UIViewController
}

final class Configurator: ConfiguratorProtocol {
    static func createTransactionListModule() -> UIViewController {
        let transactions: [Transaction] = []
        let view = TransactionsViewController()
        let viewModel = TransactionsViewModel()
        viewModel.transactions = transactions
        view.viewModel = viewModel
        view.rootView.viewModel = viewModel
        return view
    }
}
