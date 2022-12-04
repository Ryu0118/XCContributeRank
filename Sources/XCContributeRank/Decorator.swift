//
//  Decorator.swift
//  
//
//  Created by Ryu on 2022/12/02.
//

import Foundation
import XCContributeRankCore

struct Decorator {
    let contributions: [TotalContribution]
    
    private let width = 90
    
    init(contributions: [TotalContribution]) {
        self.contributions = contributions
    }
    
    func getDecoratedString() -> String {
        var decoratedString = ""
        
        let (columnTitle, renderingPoint) = generateColumnTitle()
        let divider = String(repeating: "-", count: columnTitle.count)
        
        decoratedString.newLine(
            columnTitle
                .withDivider(divider: divider)
        )
        
        for contribution in contributions {
            let contributionString = generateContribution(contribution: contribution, renderingPoint: renderingPoint)
            decoratedString.newLine(contributionString)
        }
        
        decoratedString.newLine(
            generateSum(renderingPoint: renderingPoint)
                .withDivider(divider: divider)
        )
        
        return decoratedString
    }
}

private extension Decorator {
    func generateColumnTitle() -> (String, RenderingPoint) {
        let columnTitles = ["code", "files", "comment", "blank"]
        let spacing = 13
        var string = ""
        var renderingPoint = [Int]()
        
        string.append("Contributor")
        string.whitespaces(18)
        
        for (index, columnTitle) in columnTitles.enumerated() {
            string.append(columnTitle)
            renderingPoint.append(string.count )
            
            if let next = columnTitles[safe: index + 1] {
                string.whitespaces(spacing - next.count)
            }
        }
        
        return (string, RenderingPoint(renderingPoint))
    }
    
    func generateContribution(
        contribution: TotalContribution,
        renderingPoint: RenderingPoint
    ) -> String {
        var string = ""
        let contributionData = [
            contribution.line,
            contribution.file,
            contribution.comment,
            contribution.blank
        ]
        string.append(contribution.author)
        
        for (datum, point) in zip(contributionData.map { String($0) }, renderingPoint.endIndexes) {
            
            var whitespaceCount = point - string.width - String(datum).count
            if whitespaceCount < 0 {
                whitespaceCount = 0
            }
            string.whitespaces(whitespaceCount)
            string.append(datum)
        }
        
        return string
    }
    
    func generateSum(renderingPoint: RenderingPoint) -> String {
        var string = ""
        let totalData = calculateSum().map { String($0) }
        
        string.append("Total:")
        
        for (datum, point) in zip(totalData, renderingPoint.endIndexes) {
            let whitespaceCount = point - string.count - String(datum).count
            string.whitespaces(whitespaceCount)
            string.append(datum)
        }
        
        return string
    }
    
    func calculateSum() -> [Int] {
        contributions.reduce([0, 0, 0, 0]) { previous, contribution in
            var copy = previous
            copy[0] += contribution.line
            copy[1] += contribution.file
            copy[2] += contribution.comment
            copy[3] += contribution.blank
            return copy
        }
    }
}
