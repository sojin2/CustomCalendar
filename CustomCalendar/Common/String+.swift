//
//  String+.swift
//  CustomCalendar
//
//  Created by 김소진 on 2023/09/28.
//

import Foundation
import UIKit

extension String {
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var date: Date? {
        return String.dateFormatter.date(from: self)
    }
}
