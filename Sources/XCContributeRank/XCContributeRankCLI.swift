import Foundation
import ArgumentParser
import XCContributeRankCore

@main
struct XCContributeRankCLI: ParsableCommand {
    @Argument(help: "")
    var projectPath: String
    
    static let _commandName: String = "rank"
}

