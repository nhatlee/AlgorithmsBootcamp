import Foundation

///https://leetcode.com/problems/valid-palindrome/description/?envType=study-plan-v2&envId=top-interview-150
/*
 Example 1:

 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 Example 2:

 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 Example 3:

 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.
 */


public func isPalindrome(_ s: String) -> Bool {
    let list = Array(s.lowercased().filter { $0.isLetter || $0.isNumber })
    var l = 0
    var r = list.count - 1
    while l <= r {
        if list[l] != list[r] {
            return false
        }
        l += 1
        r -= 1
    }
    return true
}
