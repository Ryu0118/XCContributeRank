//
//  String+regex.swift
//
//
//  Created by Ryu on 2022/12/02.
//

import Foundation

extension String {
    func match(_ pattern: String) -> [String] {
        let range = NSRange(location: 0, length: count)

        guard let regex = try? NSRegularExpression(pattern: pattern),
              let matched = regex.firstMatch(in: self, range: range)
        else { return [] }

        return (0 ..< matched.numberOfRanges).compactMap { index in
            let range = matched.range(at: index)

            if range.location == NSNotFound {
                return nil
            }
            return NSString(string: self).substring(with: range)
        }
    }

    func match(patterns: [String]) -> String? {
        for pattern in patterns {
            if let result = match(pattern).first {
                return result
            }
        }
        return nil
    }
}
