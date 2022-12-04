//
//  StringExtensions.swift
//
//
//  Created by Ryu on 2022/12/02.
//

import Foundation

extension String {
    mutating func newLine(_ string: String) {
        append(string + "\n")
    }

    mutating func whitespaces(_ count: Int) {
        append(String(repeating: " ", count: count))
    }

    func withDivider(divider: String) -> String {
        var string = ""
        string.newLine(divider)
        string.newLine(self)
        string.append(divider)
        return string
    }

    var width: Int {
        var sum = 0
        for char in Array(self).map({ String($0) }) {
            let doubleByteCharacterSet = CharacterSet(charactersIn: "\u{4E00}" ... "\u{9FFF}")
            let isDoubleByteString = char.allSatisfy { character in
                doubleByteCharacterSet.contains(character.unicodeScalars.first!)
            }
            sum += isDoubleByteString ? 2 : 1
        }
        return sum
    }
}
