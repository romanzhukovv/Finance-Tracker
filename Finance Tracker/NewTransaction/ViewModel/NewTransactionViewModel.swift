//
//  NewTransactionViewModel.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import UIKit

protocol NewTransactionViewModelProtocol: AnyObject {
    var router: FTRouterProtocol? { get set }
    var newTransaction: Transaction? { get set }
    var delegate: NewTransactionViewModelDelegate? { get set }
    
    func numberOfRowsForPickerView() -> Int
    func rowTitleForPickerView(row: Int) -> String
    func getAmountFromTextField(amount: String)
    func getCategoryFromPickerView(row: Int)
    func addButtonPressed()
}

final class NewTransactionViewModel: NewTransactionViewModelProtocol {
    
    var router: FTRouterProtocol?
    var newTransaction: Transaction?
    weak var delegate: NewTransactionViewModelDelegate?
    
    private var amount: Double?
    private var category: Transaction.TransactionType?
    
    func numberOfRowsForPickerView() -> Int {
        Transaction.TransactionType.PurchaseCategory.allCases.count
    }
    
    func rowTitleForPickerView(row: Int) -> String {
        Transaction.TransactionType.PurchaseCategory.allCases[row].rawValue
    }
    func getAmountFromTextField(amount: String) {
        if let amount = Double(amount), amount != 0 {
            self.amount = amount
        }
    }
    
    func getCategoryFromPickerView(row: Int) {
        category = Transaction.TransactionType.purchase(.allCases[row])
    }
    
    func addButtonPressed() {
        guard let amount = amount else { return }
        let transaction = Transaction(amount: amount, transactionType: category ?? .purchase(.groceries))
        delegate?.createNewTransaction(transaction: transaction)
        router?.popNewTransactionView()
    }
}
