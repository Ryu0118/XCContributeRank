//
//  SwiftFileFinder.swift
//
//
//  Created by Ryu on 2022/12/02.
//

import Foundation

struct SwiftFileFinder {
    let root: URL

    private let extensions = ["swift", "m", "mm", "h", "c", "cpp"]

    func find() throws -> [URL] {
        try _findSwiftFiles(url: root)
    }

    private func _findSwiftFiles(url: URL, currentURLs: [URL] = []) throws -> [URL] {
        guard let contents = try? FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles) else {
            if extensions.contains(url.pathExtension) {
                return [url]
            }
            return []
        }

        var urls = currentURLs

        for content in contents {
            if extensions.contains(content.pathExtension) {
                urls.append(content)
            } else if content.hasDirectoryPath {
                let directoryContent = try _findSwiftFiles(url: content, currentURLs: urls)
                urls = directoryContent
            }
        }
        return urls
    }
}
