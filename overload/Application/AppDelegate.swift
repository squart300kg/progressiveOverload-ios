//
//  AppDelegate.swift
//  overload
//
//  Created by SangYun Song on 2022/02/09.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Thread.sleep(forTimeInterval: 1.5)
        
        Application.getInstance.initAppScreen(in: UIWindow())
        
        return true
    }
 


}

