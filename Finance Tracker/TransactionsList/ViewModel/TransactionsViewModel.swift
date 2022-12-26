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
    var sections: [TransactionsSection] { get set }
    var newTransactionViewModel: NewTransactionViewModel? { get set }
    
    func topUpBalance(_ amount: Double)
    func addTransaction()
    func cellViewModel(at indexPath: IndexPath) -> TransactionCellViewModelProtocol
    func numbersOfSections() -> Int
    func numbersOfRowsInSection(section: Int) -> Int
    func titleForHeaderInSection(section: Int) -> String
}

protocol NewTransactionViewModelDelegate: AnyObject {
    func createNewTransaction(transaction: Transaction)
}

final class TransactionsViewModel: TransactionsViewModelProtocol {
    
    var router: FTRouterProtocol?
    var newTransactionViewModel: NewTransactionViewModel?
    var sections = [TransactionsSection]()
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
        newTransactionViewModel = NewTransactionViewModel()
        newTransactionViewModel?.delegate = self
        router?.pushNewTransactionView(viewModel: newTransactionViewModel!)
    }
    
    func cellViewModel(at indexPath: IndexPath) -> TransactionCellViewModelProtocol {
        let transaction = sections[indexPath.section].transactions[indexPath.row]
        return TransactionCellViewModel(transaction: transaction)
    }
    
    func numbersOfSections() -> Int {
        sections.count
    }
    
    func numbersOfRowsInSection(section: Int) -> Int {
        sections[section].transactions.count
    }
    
    func titleForHeaderInSection(section: Int) -> String {
        sections[section].date
    }
}

extension TransactionsViewModel {
    private func createTransaction(_ amount: Double) {
        let transaction = Transaction(amount: amount, transactionType: .topUp)
        transactions.insert(transaction, at: 0)
    }
    
    private func getSectionsByDate() {
        let groups = Dictionary(grouping: transactions) { transaction in
            transaction.date
        }
        
        sections = groups.map { (key, values) in
            return TransactionsSection(date: key, transactions: values)
        }
    }
}

extension TransactionsViewModel: NewTransactionViewModelDelegate {
    func createNewTransaction(transaction: Transaction) {
        balance -= transaction.amount
        transactions.insert(transaction, at: 0)
    }
}
