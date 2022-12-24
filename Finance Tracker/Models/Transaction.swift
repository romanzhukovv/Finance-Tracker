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
    let category: TransactionCategory
    
    enum TransactionCategory {
        case groceries
        case taxi
        case electronics
        case restaurant
        case other
    }
}
