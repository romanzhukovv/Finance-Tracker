//
//  TransactionsViewModel.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import Foundation

protocol TransactionsViewModelProtocol: AnyObject {
    var router: FTRouterProtocol? { get set }
    var balance: Double { get set }
    var transactions: [Transaction]! { get set }
    var viewModelDidChange: ((TransactionsViewModelProtocol) -> Void)? { get set }
    func topUpBalance(_ amount: Double)
    func addTransaction()
    func numbersOfRows() -> Int
}

final class TransactionsViewModel: TransactionsViewModelProtocol {
    
    var router: FTRouterProtocol?
    var viewModelDidChange: ((TransactionsViewModelProtocol) -> Void)?
    var balance: Double = 0.0
    var transactions: [Transaction]! {
        didSet {
            viewModelDidChange?(self)
        }
    }
    
    func topUpBalance(_ amount: Double) {
        balance += amount
        createTransaction(amount)
    }
    
    func addTransaction() {
        router?.pushNewTransactionView()
    }
    
    func numbersOfRows() -> Int {
        transactions.count
    }
    
    private func createTransaction(_ amount: Double) {
        let transaction = Transaction(amount: amount, date: Date(), transactionType: .topUp)
        transactions.insert(transaction, at: 0)
    }
}
