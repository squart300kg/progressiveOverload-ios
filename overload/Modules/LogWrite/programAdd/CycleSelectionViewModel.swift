//
//  CycleSelectioniViewModel.swift
//  overload
//
//  Created by SangYun Song on 2022/02/17.
//

import Foundation

class CycleSelectionViewModel: ViewModel, ViewModelType {
    
    var mesoSplitCount = 0
    var microSplitCount = 0
    var programNo = 0
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
    
    override init() {
        super.init()
    }
    
}
