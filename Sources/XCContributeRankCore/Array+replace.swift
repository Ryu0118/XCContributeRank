//
//  Array+replace.swift
//
//
//  Created by Ryu on 2022/12/02.
//

import Foundation

extension Array {
    mutating func replace(_ value: Element, at index: Int) {
        remove(at: index)
        insert(value, at: index)
    }
}
