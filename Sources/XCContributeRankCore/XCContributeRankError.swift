//
//  XCContributeRankError.swift
//
//
//  Created by Ryu on 2022/12/02.
//

import Foundation

public enum XCContributeRankError: LocalizedError {
    case cannotReadDataFromFile
    case invalidPath
    case directoryNotExists
    
    public var errorDescription: String? {
        switch self {
        case .cannotReadDataFromFile:
            return "Failed to read data from file"
        case .invalidPath:
            return "invalid file path"
        case .directoryNotExists:
            return "File or directory not found"
        }
    }
}
