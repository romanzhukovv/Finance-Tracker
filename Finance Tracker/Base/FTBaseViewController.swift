//
//  FTBaseViewController.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import UIKit

class FTBaseViewController<CustomView: UIView>: UIViewController, HasCustomView {
    typealias CustomView = CustomView
    
    override func loadView() {
        super.loadView()
        let rootView = CustomView()
        view = rootView
    }
}
