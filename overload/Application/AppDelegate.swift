//
//  AppDelegate.swift
//  overload
//
//  Created by SangYun Song on 2022/02/09.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        Application.shared.presentInitialScreen(in: self.window)
        
        return true
    }
 


}

