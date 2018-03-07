//
//  Observable+Utils.swift
//  MLDialogFlow
//
//  Created by Eli Kohen on 16/06/2017.
//  Copyright © 2017 Metropolis Lab. All rights reserved.
//

import RxSwift

public extension ObservableType {
    public func subscribeNext(onNext: ((Self.E) -> Void)?) -> Disposable {
        return subscribe(onNext: onNext)
    }
}

public extension PrimitiveSequenceType where TraitType == SingleTrait {
    public func subscribeSuccess(onSuccess: ((Self.ElementType) -> Void)?) -> Disposable {
        return subscribe(onSuccess: onSuccess, onError: nil)
    }
}

import RxSwift

extension ObservableType {

    /**
     Takes a sequence of optional elements and returns a sequence of non-optional elements, filtering out any nil values.

     - returns: An observable sequence of non-optional elements

     Copyright (c) 2016 RxSwiftCommunity https://github.com/RxSwiftCommunity
     */

    public func unwrap<T>() -> Observable<T> where E == Optional<T> {
        return self.filter { $0 != nil }.map { $0! }
    }
}
