//
//  TimeUtils.swift
//  overload
//
//  Created by SangYun Song on 2022/02/19.
//

import Foundation

class DateUtils {
    func getCurrentStringDate() -> String {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
