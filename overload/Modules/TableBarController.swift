//
//  TabBarController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/10.
//

import UIKit
import RxSwift
import RxCocoa
import RxViewController
import NSObject_Rx

enum TabBarItem: Int {
    case logWrite, logRead
    
    private func controller(with viewModel: ViewModel, navigator: Navigator) -> UIViewController {
        switch self {
        case .logWrite:
            let vc = LogWriteController(viewModel: viewModel, navigator: navigator)
            currentView_0 = vc
            return NavigationController(rootViewController: vc)
        case .logRead:
            let vc = LogReadController(viewModel: viewModel, navigator: navigator)
            currentView_1 = vc
            return NavigationController(rootViewController: vc)
        }
    }
    
    var unselectedImage: UIImage? {
        switch self {
        case .logWrite: return R.image.icon_tabbar_unselected_write()
        case .logRead: return R.image.icon_tabbar_unselected_read()
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .logWrite: return R.image.icon_tabbar_selected_write()
        case .logRead: return R.image.icon_tabbar_selected_read()
        }
    }
    
    var title: String {
        switch self {
        case .logWrite: return "일지 기록"
        case .logRead: return "일지 조회"
        }
    }
    
    func getController(with viewModel: ViewModel, navigator: Navigator) -> UIViewController {
        let vc = controller(with: viewModel, navigator: navigator)
        let item = UITabBarItem()
        item.image = unselectedImage?.withRenderingMode(.alwaysOriginal)
        item.selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
        item.title = title
        vc.tabBarItem = item
        return vc
    }
}

class TableBarController: UITabBarController, Navigatable {
    
    var viewModel: TabBarViewModel?
    var navigator: Navigator!
    
    init(viewModel: ViewModel?, navigator: Navigator) {
        self.viewModel = viewModel as? TabBarViewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarVC = self
        makeUI()
        bindViewModel()
    }
    
    private func makeUI() {
        self.tabBarController?.tabBar.barTintColor = .white
        self.tabBarController?.tabBar.isTranslucent = false
          
        if #available(iOS 13, *) {
            let appearance = UITabBarAppearance()
            appearance.backgroundImage = UIImage.colorForNavBar(color: .white)
            appearance.shadowImage = UIImage.colorForNavBar(color: MainColor().black!)

            appearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4.0)
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: MainColor().unselected_tab_bar!
            ]

            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: MainColor().black!
            ]

            self.tabBar.standardAppearance = appearance
        } else {
            UITabBar.appearance().backgroundImage = UIImage.colorForNavBar(color: .white)
            UITabBar.appearance().shadowImage = UIImage.colorForNavBar(color: MainColor().black!)

            let appearance = UITabBarItem.appearance()

            appearance.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4.0)
            appearance.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: MainColor().unselected_tab_bar!
            ], for: .normal)
            appearance.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: MainColor().black!
            ], for: .selected)
        }
    }
    
    func bindViewModel() {
        guard let viewModel = viewModel else { return }
        let input = TabBarViewModel.Input(initTrigger: rx.viewDidAppear.mapToVoid())
        let output = viewModel.transform(input: input)

        output.tabBarItems.drive(onNext: { [weak self] (tabBarItems) in
            if let strongSelf = self {
                let controllers = tabBarItems.map { $0.getController(with: viewModel.viewModel(for: $0), navigator: strongSelf.navigator) }
                strongSelf.setViewControllers(controllers, animated: false)
            }
        }).disposed(by: rx.disposeBag)
    }
}
