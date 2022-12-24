//
//  ViewController.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 24.12.2022.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "0$"
        label.font = .systemFont(ofSize: 24)
        label.backgroundColor = .systemGray6
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    private let replesnishButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
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
        
        view.backgroundColor = .white
        
        transactionsList.delegate = self
        transactionsList.dataSource = self
        transactionsList.register(UITableViewCell.self, forCellReuseIdentifier: "transactionCell")
        
        view.addSubview(balanceLabel)
        view.addSubview(replesnishButton)
        view.addSubview(addTransactionButton)
        view.addSubview(transactionsList)
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        replesnishButton.translatesAutoresizingMaskIntoConstraints = false
        addTransactionButton.translatesAutoresizingMaskIntoConstraints = false
        transactionsList.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            balanceLabel.heightAnchor.constraint(equalToConstant: 50),
            
            replesnishButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            replesnishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            replesnishButton.heightAnchor.constraint(equalToConstant: 50),
            replesnishButton.widthAnchor.constraint(equalToConstant: 70),
            replesnishButton.leadingAnchor.constraint(equalTo: balanceLabel.trailingAnchor, constant: 20),
            
            addTransactionButton.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 20),
            addTransactionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addTransactionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addTransactionButton.heightAnchor.constraint(equalToConstant: 50),
            
            transactionsList.topAnchor.constraint(equalTo: addTransactionButton.bottomAnchor, constant: 20),
            transactionsList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transactionsList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            transactionsList.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension TransactionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionsList.dequeueReusableCell(withIdentifier: "transactionCell")!
        cell.textLabel?.text = "sdf"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        transactionsList.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Transactions"
    }
    
    
}

