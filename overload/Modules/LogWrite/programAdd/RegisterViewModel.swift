//
//  RegisterViewModel.swift
//  overload
//
//  Created by SangYun Song on 2022/02/18.
//

import Foundation

class RegisterViewModel: ViewModel, ViewModelType {
    
    var programNo = 0
    var mesoCycleSplitIndex = 0
    var microCycleSplitIndex = 0
    
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
