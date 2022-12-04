//
//  File.swift
//
//
//  Created by Ryu on 2022/12/02.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
