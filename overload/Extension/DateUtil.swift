//
//  TimeUtils.swift
//  overload
//
//  Created by SangYun Song on 2022/02/19.
//

import Foundation

class DateUtils {
    func getCurrentDateForProgramName() -> String {
        let now = Date()

        let date = DateFormatter()
        date.locale = Locale(identifier: "ko_kr")
        date.timeZone = TimeZone(abbreviation: "KST") // "2018-03-21 18:07:27"
        //date.timeZone = TimeZone(abbreviation: "NZST") // "2018-03-21 22:06:39"
        date.dateFormat = "yyyy년 MM월 dd일 HH시 mm분 ss초"

        let kr = date.string(from: now)
        return kr
    }
}
