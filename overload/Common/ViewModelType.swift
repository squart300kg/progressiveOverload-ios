//
//  ViewModelType.swift
//  overload
//
//  Created by SangYun Song on 2022/02/10.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}

class ViewModel: NSObject {
    
    override init() {
        
    }
}


