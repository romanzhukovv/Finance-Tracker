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
    var time: String { get }
    var transactionType: String { get }
    init(transaction: Transaction)
}

final class TransactionCellViewModel: TransactionCellViewModelProtocol {
    var amountColor: UIColor = .black
    
    var amount: String {
        getTransactionSign() + "\(transaction.amount)"
    }
    
    var time: String {
        "\(transaction.time)"
    }
    
    var transactionType: String {
        switch transaction.transactionType {
        case .topUp:
            return "Top Up"
        case .purchase(let category):
            return category.rawValue
        }
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
