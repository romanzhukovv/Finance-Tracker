//
//  ViewController.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 24.12.2022.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    var viewModel: TransactionsViewModelProtocol!
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "0.0 $"
        label.font = .systemFont(ofSize: 24)
        label.backgroundColor = .systemGray6
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    private let topUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("Top Up", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let addTransactionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("Add transaction", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let transactionsList: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transactions"
        view.backgroundColor = .white
        
        transactionsList.delegate = self
        transactionsList.dataSource = self
        transactionsList.register(UITableViewCell.self, forCellReuseIdentifier: "transactionCell")
        
        view.addSubview(balanceLabel)
        view.addSubview(topUpButton)
        view.addSubview(addTransactionButton)
        view.addSubview(transactionsList)
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        topUpButton.translatesAutoresizingMaskIntoConstraints = false
        addTransactionButton.translatesAutoresizingMaskIntoConstraints = false
        transactionsList.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            balanceLabel.heightAnchor.constraint(equalToConstant: 50),
            
            topUpButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topUpButton.heightAnchor.constraint(equalToConstant: 50),
            topUpButton.widthAnchor.constraint(equalToConstant: 80),
            topUpButton.leadingAnchor.constraint(equalTo: balanceLabel.trailingAnchor, constant: 20),
            
            addTransactionButton.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 20),
            addTransactionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addTransactionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addTransactionButton.heightAnchor.constraint(equalToConstant: 50),
            
            transactionsList.topAnchor.constraint(equalTo: addTransactionButton.bottomAnchor, constant: 20),
            transactionsList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transactionsList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            transactionsList.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        addTransactionButton.addTarget(self, action: #selector(addTransactionButtonAction), for: .touchUpInside)
        topUpButton.addTarget(self, action: #selector(topUpButtonAction), for: .touchUpInside)
        
        viewModel.viewModelDidChange = { [weak self] viewModel in
            guard let self = self else { return }
            self.balanceLabel.text = "\(self.viewModel.balance)"
        }
    }
    
    @objc private func addTransactionButtonAction() {
        let newTransactionVC = NewTransactionViewController()
        navigationController?.pushViewController(newTransactionVC, animated: true)
    }
    
    @objc private func topUpButtonAction() {
        viewModel.topUpBalance(200)
        transactionsList.reloadData()
    }
}

extension TransactionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionsList.dequeueReusableCell(withIdentifier: "transactionCell")!
        let transaction = viewModel.transactions[indexPath.row]
        cell.textLabel?.text = "\(transaction.amount)   \(transaction.date)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        transactionsList.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Transactions"
    }
}

