//
//  TransactionsView.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import UIKit

final class TransactionsView: FTBaseView {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        viewModel.viewModelDidChange = { [weak self] viewModel in
            guard let self = self else { return }
            self.balanceLabel.text = "\(self.viewModel.balance)"
        }
    }
}

extension TransactionsView {
    override func addViews() {
        super.addViews()
        
        setupViews(balanceLabel,
                   topUpButton,
                   addTransactionButton,
                   transactionsList)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            balanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            balanceLabel.heightAnchor.constraint(equalToConstant: 50),
            
            topUpButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            topUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            topUpButton.heightAnchor.constraint(equalToConstant: 50),
            topUpButton.widthAnchor.constraint(equalToConstant: 80),
            topUpButton.leadingAnchor.constraint(equalTo: balanceLabel.trailingAnchor, constant: 20),
            
            addTransactionButton.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 20),
            addTransactionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            addTransactionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addTransactionButton.heightAnchor.constraint(equalToConstant: 50),
            
            transactionsList.topAnchor.constraint(equalTo: addTransactionButton.bottomAnchor, constant: 20),
            transactionsList.leadingAnchor.constraint(equalTo: leadingAnchor),
            transactionsList.trailingAnchor.constraint(equalTo: trailingAnchor),
            transactionsList.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        transactionsList.delegate = self
        transactionsList.dataSource = self
        transactionsList.register(UITableViewCell.self, forCellReuseIdentifier: "transactionCell")
        
        addTransactionButton.addTarget(self, action: #selector(addTransactionButtonAction), for: .touchUpInside)
        topUpButton.addTarget(self, action: #selector(topUpButtonAction), for: .touchUpInside)
    }
    
    @objc private func addTransactionButtonAction() {
//        let newTransactionVC = NewTransactionViewController()
//        navigationController?.pushViewController(newTransactionVC, animated: true)
    }
    
    @objc private func topUpButtonAction() {
        viewModel.topUpBalance(200)
        transactionsList.reloadData()
    }
}

extension TransactionsView: UITableViewDataSource, UITableViewDelegate {
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
