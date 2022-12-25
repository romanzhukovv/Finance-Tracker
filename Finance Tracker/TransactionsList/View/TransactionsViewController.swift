//
//  ViewController.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 24.12.2022.
//

import UIKit

final class TransactionsViewController: FTBaseViewController<TransactionsView> {
    
    var viewModel: TransactionsViewModelProtocol!
    
//    override func loadView() {
//        super.loadView()
//        rootView.viewModel = viewModel
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transactions"
    }
}

