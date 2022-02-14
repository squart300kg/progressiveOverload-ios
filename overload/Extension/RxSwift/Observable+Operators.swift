//
//  Observable+Operators.swift
//  overload
//
//  Created by SangYun Song on 2022/02/12.
//

import Foundation
import RxSwift
import RxCocoa
import RxGesture

extension Reactive where Base: UIView {
    func tap() -> Observable<Void> {
        return tapGesture().when(.recognized).mapToVoid()
    }
}

extension ObservableType {

    func catchErrorJustComplete() -> Observable<Element> {
        return catchError { _ in
            return Observable.empty()
        }
    }

    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { error in
            assertionFailure("Error \(error)")
            return Driver.empty()
        }
    }

    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}


