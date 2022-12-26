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
    var sections: [TransactionSection] { get set }
    
    func topUpBalance(_ amount: Double)
    func addTransaction()
    func cellViewModel(at indexPath: IndexPath) -> TransactionCellViewModelProtocol
}

final class TransactionsViewModel: TransactionsViewModelProtocol {
    
    var router: FTRouterProtocol?
    var sections = [TransactionSection]()
    var viewModelDidChange: ((TransactionsViewModelProtocol) -> Void)?
    var balance: Double = 0.0
    var transactions: [Transaction]! {
        didSet {
            getSectionsByDate()
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
    
    func cellViewModel(at indexPath: IndexPath) -> TransactionCellViewModelProtocol {
        let transaction = sections[indexPath.section].transactions[indexPath.row]
        return TransactionCellViewModel(transaction: transaction)
    }
    
    private func createTransaction(_ amount: Double) {
        let transaction = Transaction(amount: amount, transactionType: .topUp)
        transactions.insert(transaction, at: 0)
    }
    
    private func getSectionsByDate() {
        let groups = Dictionary(grouping: transactions) { transaction in
            transaction.date
        }
        
        sections = groups.map { (key, values) in
            return TransactionSection(date: key, transactions: values)
        }
    }
}
