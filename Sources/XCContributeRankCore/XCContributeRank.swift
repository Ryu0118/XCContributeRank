//
//  XCContributeRank.swift
//  
//
//  Created by Ryu on 2022/12/02.
//

import Foundation

public struct XCContributeRank {
    let root: URL
    
    public init(root: URL) {
        self.root = root
    }
    
    public func getContributions() throws -> [TotalContribution] {
        try totalize()
            .sorted { $0.line + $0.file > $1.line + $0.file }
    }
}

private extension XCContributeRank {
    
    func totalize() throws -> [TotalContribution] {
        let statuses = try getAllStatuses()
        
        var totalStatuses = [TotalContribution]()
        
        for status in statuses {
            guard let index = totalStatuses.firstIndex(where: { $0.author == status.author }) else {
                let authorStatus = TotalContribution(
                    author: status.author,
                    line: status.line,
                    comment: status.comment,
                    blank: status.blank,
                    file: 1
                )
                
                totalStatuses.append(authorStatus)
                continue
            }
            
            var authorStatus = totalStatuses[index]
            
            authorStatus.increment(\.line, value: status.line)
            authorStatus.increment(\.comment, value: status.comment)
            authorStatus.increment(\.blank, value: status.blank)
            authorStatus.increment(\.file, value: 1)
            
            totalStatuses.replace(authorStatus, at: index)
        }
        
        return totalStatuses
    }
    
    func getAllStatuses() throws -> [FileStatus] {
        try SwiftFileFinder(root: root)
            .find()
            .map { try SwiftFileReader(file: $0).read() }
    }
    
}
