//
//  TabBarController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/10.
//

import UIKit
import RxSwift
import RxCocoa

enum TabBarItem: Int {
    case logWrite, logRead
}
class TableBarController: UITabBarController, Navigatable {
    
    var viewModel: TableBarViewModel?
    var navigator: Navigator!
    
    init(viewModel: ViewModel?, navigator: Navigator) {
        self.viewModel = viewModel as? TableBarViewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        makeUI()
    }
    
    private func makeUI() {
        view.backgroundColor = .red
        self.tabBarController?.tabBar.barTintColor = .red
        self.tabBarController?.tabBar.isTranslucent = false
    }
}
