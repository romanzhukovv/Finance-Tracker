//
//  ViewController.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 24.12.2022.
//

import UIKit

final class TransactionsViewController: FTBaseViewController<TransactionsView> {
    
    var viewModel: TransactionsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.topUpButtonAction(self, with: #selector(topUpButtonAction), for: .touchUpInside)
    }
    
    private func showAlert(completion: @escaping(String) -> Void) {
        let alert = UIAlertController(title: "Top Up your balance",
                                      message: "Enter amount, please",
                                      preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Ok", style: .default) { _ in
            if let amount = alert.textFields?.first?.text, !amount.isEmpty, Double(amount) != nil, Double(amount) != 0 {
                completion(amount)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        alert.addTextField { textField in
            textField.placeholder = "Enter amount"
        }
        
        present(alert, animated: true)
    }
    
    @objc private func topUpButtonAction() {
        showAlert { [weak self] amount in
            guard let self = self else { return }
            self.viewModel.topUpBalance(Double(amount) ?? 0.0)
        }
    }
}

