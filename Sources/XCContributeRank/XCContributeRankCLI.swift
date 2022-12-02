import Foundation
import ArgumentParser
import XCContributeRankCore

@main
public struct XCContributeRankCLI {
    public static func main() throws {
        let xccrank = XCContributeRank(root: URL(string: "/Users/shibuya/Swift-Application/MyPackage/VoteApp")!)
        let status = try xccrank.getRanking()
        print(status)
    }
}

