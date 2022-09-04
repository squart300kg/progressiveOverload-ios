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
    static let shared = Navigator()
    
    enum Scene {
        case main
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
    
}


