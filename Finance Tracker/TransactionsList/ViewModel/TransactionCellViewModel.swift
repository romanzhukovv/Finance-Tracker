//
//  TransactionCellViewModel.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 26.12.2022.
//

import UIKit

protocol TransactionCellViewModelProtocol {
    var amount: String { get }
    var amountColor: UIColor { get }
    var date: String { get }
    var transactionType: String { get }
    init(transaction: Transaction)
}

final class TransactionCellViewModel: TransactionCellViewModelProtocol {
    var amountColor: UIColor = .black
    
    var amount: String {
        getTransactionSign() + "\(transaction.amount)"
    }
    
    var date: String {
        "\(transaction.date)"
    }
    
    var transactionType: String {
        "\(transaction.transactionType)"
    }
    
    private let transaction: Transaction
    
    init(transaction: Transaction) {
        self.transaction = transaction
    }
    
    private func getTransactionSign() -> String {
        switch transaction.transactionType {
        case .topUp:
            amountColor = .systemGreen
            return "+"
        case .purchase(_):
            return "-"
        }
    }
}
