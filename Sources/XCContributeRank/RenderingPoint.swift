//
//  RenderingPoint.swift
//
//
//  Created by Ryu on 2022/12/02.
//

import Foundation

struct RenderingPoint {
    let codeEndIndex: Int
    let filesEndIndex: Int
    let commentEndIndex: Int
    let blankEndIndex: Int
    let endIndexes: [Int]

    init(_ array: [Int]) {
        codeEndIndex = array[0]
        filesEndIndex = array[1]
        commentEndIndex = array[2]
        blankEndIndex = array[3]
        endIndexes = array
    }
}
