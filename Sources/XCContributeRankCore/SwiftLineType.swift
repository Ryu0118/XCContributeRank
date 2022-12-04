//
//  SwiftLineType.swift
//  
//
//  Created by Ryu on 2022/12/02.
//

import Foundation

enum SwiftLineType {
    case code, comment, blank
    
    static var isCommentContinuing = false
    
    init(_ line: String) {
        let trimmed = line.trimmingCharacters(in: .whitespaces)

        if trimmed.contains("/*") {
            SwiftLineType.isCommentContinuing = true
            self = .comment
        }
        else if trimmed.contains("*/") {
            SwiftLineType.isCommentContinuing = false
            self = .comment
        }
        else if trimmed.hasPrefix("//") || trimmed.hasPrefix("///") || SwiftLineType.isCommentContinuing
        {
            self = .comment
        }
        else if trimmed.isEmpty {
            self = .blank
        }
        else {
            self = .code
        }
    }
}
