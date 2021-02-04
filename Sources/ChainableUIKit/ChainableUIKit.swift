//
//  ChainableUIKit.swift
//
//
//  Created by 林博文 on 2021/1/18.
//

import Foundation

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

public enum DataSourceOperation {
    case diff([DataSourceDiffOperation])
    case reload
}

public enum DataSourceDiffOperation {
    case insertSections(IndexSet)
    case deleteSections(IndexSet)
    case updateSections(IndexSet)
    case moveSections([(at: Int, to: Int)])
    case insert([IndexPath])
    case delete([IndexPath])
    case update([IndexPath])
    case move([(at: IndexPath, to: IndexPath)])
}
