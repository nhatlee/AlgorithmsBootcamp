//
//  Test.swift
//  Algorimths
//
//  Created by Nhat Le Tien on 15/1/25.
//

import Testing
@testable import Algorimths
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
struct Test {

    @Test("Longest substring without repeating characters")
    func longestSubStringWithoutRepeatingCharacters () async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        #expect(lengthOfLongestSubstring("abcabcbb") == 3)
        #expect(lengthOfLongestSubstring("bbbbb") == 1)
        #expect(lengthOfLongestSubstring("pwwkew") == 3)
        #expect(lengthOfLongestSubstring(" ") == 1)
        #expect(lengthOfLongestSubstring("") == 0)
        #expect(lengthOfLongestSubstring("c") == 1)
    }
    
    @Test("MaxOfKContiguousElement")
    func tesMaxOfKContiguousElement () async throws {
//        #expect(maxOfKTotalContiguousElement(list: [3, 5, -2, 8, 10], k: 3) == 16)
        #expect(maxOfKTotalContiguousElement(list: [3, 5, 7, 8, 4, 6], k: 3) == 16)
    }
    

}
