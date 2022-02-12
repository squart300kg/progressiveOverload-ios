//
//  TabBarViewModel.swift
//  overload
//
//  Created by SangYun Song on 2022/02/10.
//

import Foundation
import RxSwift
import RxCocoa

class TabBarViewModel: ViewModel, ViewModelType {
    
    struct Input {
        let initTrigger: Observable<Void>
    }
    
    struct Output {
        let tabBarItems: Driver<[TabBarItem]>
    }
    
    func transform(input: Input) -> Output {
        let authorized = true
        let tabBarItems = Observable.just(authorized).map { (authorized) ->
            [TabBarItem] in if authorized {
                return [.logWrite, .logRead]
            } else {
                return [.logWrite, .logRead]
            }
        }.asDriver(onErrorJustReturn: [])
        
        return Output(tabBarItems: tabBarItems)
    }
    
    override init() {
        super.init()
    }
    
    func viewModel(for tabBarItem: TabBarItem) -> ViewModel {
        switch tabBarItem {
        case .logWrite:
            let viewModel = LogWriteViewModel()
            return viewModel
        case .logRead:
            let viewModel = LogReadViewModel()
            return viewModel
        }
    }
}
