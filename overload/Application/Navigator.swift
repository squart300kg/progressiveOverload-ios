//
//  Navigator.swift
//  overload
//
//  Created by SangYun Song on 2022/02/10.
//

import Foundation
import UIKit
import Hero

protocol Navigatable {
    var navigator: Navigator! { get set }
}

class Navigator {
    static var shared = Navigator()
    
    enum Scene {
        case tabs(viewModel: TabBarViewModel)
    }
    
    enum Transition {
        case root(in: UIWindow)
        case navigation(type: HeroDefaultAnimationType)
        case customModel(type: HeroDefaultAnimationType)
        case model
        case detail
        case custom
        case fullModal
    }
    
    func get(segue: Scene) -> UIViewController? {
        switch segue {
        case .tabs(let viewModel): return TableBarController(viewModel: viewModel, navigator: self)
        }
        
    }
    
    func show(segue: Scene, sender: UIViewController?, transition: Transition = .navigation(type: .cover(direction: .left))) {
        if let target = get(segue: segue) {
            show(target: target, sender: sender, transition: transition)
        }
    }
    
    private func show(target: UIViewController, sender: UIViewController?, transition: Transition) {
        switch transition {
        case .root(in: let window):
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                window.rootViewController = target
                window.makeKeyAndVisible()
            }, completion: nil)
            return
        case .custom: return
        default: break
        }
        
//        guard let sender = sender else {
//            fatalError("You need to pass in a sender for .navigation or .modal transitions")
//        }
//
//        if let nav = sender as? UINavigationController {
//            nav.pushViewController(target, animated: false)
//            return
//        }
//
//        switch transition {
//        case .root(let in, let uIWindow):
//            <#code#>
//        case .navigation(let type):
//            <#code#>
//        case .customModel(let type):
//            <#code#>
//        case .model:
//            <#code#>
//        case .detail:
//            <#code#>
//        case .custom:
//            <#code#>
//        case .fullModal:
//            <#code#>
//        }
    }
    
}


