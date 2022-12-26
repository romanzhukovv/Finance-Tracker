//
//  NewTransactionView.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import UIKit

final class NewTransactionView: FTBaseView {
    
    var viewModel: NewTransactionViewModelProtocol!
    
    private let amountTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 18, weight: .regular)
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter amount, please",
            attributes: [
                .foregroundColor: UIColor.systemGray,
                .font: UIFont.systemFont(ofSize: 18, weight: .regular)
                        ]
        )
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let categoryPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        return button
    }()
}

extension NewTransactionView {
    override func addViews() {
        super.addViews()
        
        setupViews(amountTextField, categoryPickerView, addButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            amountTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            amountTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            amountTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            amountTextField.heightAnchor.constraint(equalToConstant: 50),
            
            categoryPickerView.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 20),
            categoryPickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            categoryPickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            categoryPickerView.heightAnchor.constraint(equalToConstant: 100),
            
            addButton.topAnchor.constraint(equalTo: categoryPickerView.bottomAnchor, constant: 20),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
    }
    
    @objc private func addButtonAction() {
        viewModel.getAmountFromTextField(amount: amountTextField.text ?? "")
        viewModel.addButtonPressed()
    }
}

extension NewTransactionView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.numberOfRowsForPickerView()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.rowTitleForPickerView(row: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.getCategoryFromPickerView(row: row)
    }
}
