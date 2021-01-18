//
//  ChainableUIKit.swift
//
//
//  Created by 林博文 on 2021/1/18.
//

public struct ChainableWrapper<Wrapped> {
    
    public let wrapped: Wrapped
    
    public init(wrapped: Wrapped) {
        self.wrapped = wrapped
    }
    
}

public protocol ChainableType {}

public extension ChainableType {
    
    var chainable: ChainableWrapper<Self> { ChainableWrapper(wrapped: self) }
    
}
