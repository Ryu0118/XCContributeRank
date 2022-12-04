import Foundation
import ArgumentParser
import XCContributeRankCore

@main
struct XCContributeRankCLI: ParsableCommand {
    @Argument(help: "")
    var projectPath: String
    
    static let _commandName: String = "rank"
    
    mutating func run() throws {
        guard let url = URL(string: projectPath) else {
            throw XCContributeRankError.invalidPath
        }
        
        let xcContributeRank = XCContributeRank(root: url)
        let contributions = try xcContributeRank.getContributions()
        let decorator = Decorator(contributions: contributions)
        let result = decorator.getDecoratedString()

        print(result)
    }
}
