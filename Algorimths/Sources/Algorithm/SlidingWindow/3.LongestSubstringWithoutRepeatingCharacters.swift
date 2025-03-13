//
//  File.swift
//  Algorimths
//
//  Created by Nhat Le Tien on 15/1/25.
//

import Foundation
/*
 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */
public func lengthOfLongestSubstring(_ s: String) -> Int {
    guard !s.isEmpty else {
        return 0
    }
    guard !s.isWhitespace() else {
        return 1
    }
    var counter = 0
    var maxList = [Int]()
    var countDict: [Character: Int] = [:]
    for char in s {
        if let _ = countDict[char] {
            maxList.append(counter)
            counter = 1
        } else {
            counter += 1
            countDict[char] = counter
        }
        countDict[char] = counter
    }
    return maxList.max() ?? 0
}

extension String {
    func isWhitespace() -> Bool {
        
        // Check empty string
        if self.isEmpty {
            return true
        }
        // Trim and check empty string
        return (self.trimmingCharacters(in: .whitespaces) == "")
    }
}
