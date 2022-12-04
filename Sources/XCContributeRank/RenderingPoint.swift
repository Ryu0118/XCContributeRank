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
        self.codeEndIndex = array[0]
        self.filesEndIndex = array[1]
        self.commentEndIndex = array[2]
        self.blankEndIndex = array[3]
        self.endIndexes = array
    }
}
