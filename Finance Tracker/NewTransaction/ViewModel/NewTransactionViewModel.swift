//
//  NewTransactionViewModel.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import UIKit

protocol NewTransactionViewModelProtocol: AnyObject {
    var router: FTRouterProtocol? { get set }
    func addButtonPressed()
}

final class NewTransactionViewModel: NewTransactionViewModelProtocol {
    
    var router: FTRouterProtocol?
    
    func addButtonPressed() {
        router?.dismissNewTransactionView()
    }
}
