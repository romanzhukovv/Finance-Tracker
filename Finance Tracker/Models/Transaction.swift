//
//  Transaction.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import Foundation

struct Transaction {
    let amount: Double
    let date: Date
    let transactionType: TransactionType
    
    enum TransactionType {
        case topUp
        case purchase(PurchaseCategory)
        
        enum PurchaseCategory {
            case groceries
            case taxi
            case electronics
            case restaurant
            case other
        }
    }
    
}
