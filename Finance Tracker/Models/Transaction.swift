//
//  Transaction.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import Foundation

struct Transaction {
    let amount: Double
    let date = Date().toString("dd.MM.yyyy")
    let time = Date().toString("HH:mm:ss")
    let transactionType: TransactionType
    
    enum TransactionType {
        case topUp
        case purchase(PurchaseCategory)
        
        enum PurchaseCategory: String {
            case groceries = "Groceries"
            case taxi = "Taxi"
            case electronics = "Electronics"
            case restaurant = "Restaurant"
            case other = "Other"
        }
    }
}

struct TransactionSection {
    let date: String
    let transactions: [Transaction]
}
