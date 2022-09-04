//
//  Application.swift
//  overload
//
//  Created by SangYun Song on 2022/02/10.
//

import UIKit

final class Application: NSObject {
    
    static let getInstance = Application()
    
    private override init() {
        super.init()
        updateProvider()
    }
    
    private func updateProvider() { }
    
    func initAppScreen(in window: UIWindow?) {
        guard let window = window else { return }
        
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            window.rootViewController = HomeController()
            window.makeKeyAndVisible()
        }, completion: nil)
    }
}
