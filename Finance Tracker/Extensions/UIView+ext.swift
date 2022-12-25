//
//  UIView+ext.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 25.12.2022.
//

import UIKit

protocol HasCustomView {
    associatedtype CustomView: UIView
}

extension UIView {
    func setupViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

extension HasCustomView where Self: UIViewController {
    var rootView: CustomView {
        guard let view = view as? CustomView
        else {
            fatalError("Expected view to be of type \(CustomView.self) but got \(type(of: view)) instead")
        }
        return view
    }
}
