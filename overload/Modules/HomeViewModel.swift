//
//  HomeViewModel.swift
//  overload
//
//  Created by SangYun Song on 2022/09/23.
//

import Foundation
import FirebaseAnalytics

class HomeViewModel {
    
    func sendAppStartEvent() {
        Analytics.logEvent(AnalyticsEventAppOpen, parameters: [
            AnalyticsParameterStartDate: DateUtils().getCurrentStringDate() + "-iOS"
        ])
    }
    
}
