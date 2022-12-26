//
//  Date+ext.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 26.12.2022.
//

import Foundation

extension DateComponentsFormatter {
    static let audioTime: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter
    }()
}

extension Date {
    func toString(_ format: String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
