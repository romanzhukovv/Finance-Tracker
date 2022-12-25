//
//  ViewController.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 24.12.2022.
//

import UIKit

final class TransactionsViewController: FTBaseViewController<TransactionsView> {
    
    var viewModel: TransactionsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transactions"
        
        rootView.addTransactionButton(self, with: #selector(addTransactionButtonAction), for: .touchUpInside)
    }
    
    @objc private func addTransactionButtonAction() {
//        let newTransactionVC = NewTransactionViewController()
//        newTransactionVC.title = "New Transaction"
//        newTransactionVC.navigationItem.largeTitleDisplayMode = .never
//        navigationController?.pushViewController(newTransactionVC, animated: true)
        viewModel.addTransaction()
    }
}

