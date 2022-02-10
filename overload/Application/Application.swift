//
//  Application.swift
//  overload
//
//  Created by SangYun Song on 2022/02/10.
//

import UIKit

final class Application: NSObject {
    
    static let shared = Application()
    
    var window: UIWindow?
    
//    var provider: SqlLiteAPI
    let navigator: Navigator
    
    private override init() {
        navigator = Navigator.shared
        super.init()
        updateProvider()
    }
    
    private func updateProvider() {
//        let serviceProvider =
//        let sqlLiteApi =
//        provider = roomApi
    }
    
    func presentInitialScreen(in window: UIWindow?) {
//        guard let window = window, provider = provider else {return}
        guard let window = window else { return }
        self.window = window
        let viewModel = TableBarViewModel()
        self.navigator.show(segue: .tabs(viewModel: viewModel), sender: nil, transition: .root(in: window))
    }
}
