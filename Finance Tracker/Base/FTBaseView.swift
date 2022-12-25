//
//  FTBaseView.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import UIKit

class FTBaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        layoutViews()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension FTBaseView {
    func addViews() {
        
    }
    
    func layoutViews() {
        
    }
    
    func configureViews() {
        backgroundColor = .white
    }
}
