//
//  TotalContribution.swift
//  
//
//  Created by Ryu on 2022/12/02.
//

import Foundation

public struct TotalContribution {
    public let author: String
    public private(set) var line: Int
    public private(set) var comment: Int
    public private(set) var blank: Int
    public private(set) var file: Int
}

extension TotalContribution {
    mutating func increment<T: AdditiveArithmetic>(_ keyPath: KeyPath<Self, T>, value: T){
        if let keyPath = keyPath as? WritableKeyPath {
            self[keyPath: keyPath] += value
        }
    }
}
