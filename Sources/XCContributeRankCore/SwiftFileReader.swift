//
//  SwiftFileReader.swift
//  
//
//  Created by Ryu on 2022/12/02.
//

import Foundation

struct SwiftFileReader {
    let file: URL
    
    func read() throws -> FileStatus {
        try startAnalyze()
    }
}

private extension SwiftFileReader {
    
    func getLines() throws -> [String] {
        let data = try Data(contentsOf: file)
        
        guard let code = String(data: data, encoding: .utf8) else {
            throw XCContributeRankError.cannotReadDataFromFile
        }
        
        return code.components(separatedBy: "\n")
    }
    
    func startAnalyze() throws -> FileStatus {
        let lines = try getLines()
        
        var comment = 0
        var blank = 0
        var code = 0
        var createdBy: String?
        
        for line in lines {
            let lineType = SwiftLineType(line)
            
            switch lineType {
            case .comment:
                comment += 1
                
                if createdBy == nil {
                    createdBy = getCreatedBy(line)
                }
            case .blank:
                blank += 1
            case .code:
                code += 1
            }
        }
        
        return FileStatus(line: code, blank: blank, comment: comment, author: createdBy)
    }
    
    func getCreatedBy(_ comment: String) -> String? {
        comment.match(#"(?<=\Created by ).*?(?=\ on )"#).first
    }
    
}
