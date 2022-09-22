//
//  AppDelegate.swift
//  overload
//
//  Created by SangYun Song on 2022/02/09.
//

import UIKit
import Firebase
      
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        Thread.sleep(forTimeInterval: 1.5)
        
        window = UIWindow()
        Application.getInstance.initAppScreen(in: self.window)
       
        return true
    }
}

