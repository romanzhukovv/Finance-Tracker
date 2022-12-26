//
//  TransactionViewCellTableViewCell.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 26.12.2022.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    static let reuseId = "transactionCell"
    
    var viewModel: TransactionCellViewModelProtocol! {
        didSet {
            updateCell()
        }
    }
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TransactionTableViewCell {
    private func addViews() {
        contentView.setupViews(verticalStackView, amountLabel)
        verticalStackView.addArrangedSubview(categoryLabel)
        verticalStackView.addArrangedSubview(timeLabel)
    }
    
    private func layoutViews() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            verticalStackView.widthAnchor.constraint(equalToConstant: 150),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            amountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            amountLabel.leadingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: 10)
        ])
    }
    
    private func updateCell() {
        amountLabel.text = "\(viewModel.amount)$"
        amountLabel.textColor = viewModel.amountColor
        categoryLabel.text = "\(viewModel.transactionType)"
        timeLabel.text = viewModel.time
    }
}
