import Foundation

///https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/description/?envType=study-plan-v2&envId=top-interview-150
public func strStr(_ haystack: String, _ needle: String) -> Int {
    // My solution:
    //    guard let range = haystack.range(of: needle) else {
    //        return -1
    //    }
    //    let indexInt = haystack.distance(from: haystack.startIndex, to: range.lowerBound)
    //    return indexInt
    
    // Other
    ///https://www.youtube.com/watch?v=Gjkhm1gYIMw
    if needle.isEmpty {
        return -1
    }
    let hCount = haystack.count
    let nCount = needle.count
    let hLeng = hCount// + 1 - nCount // Why need +1-nCount ???
    for i in stride(from: 0, to: hLeng, by: 1) {
        for j in stride(from: 0, through: nCount, by: 1) {
            let hindex = haystack.index(haystack.startIndex, offsetBy: i + j)
            let nIndex = needle.index(needle.startIndex, offsetBy: j)
            if haystack[hindex] != needle[nIndex] {
                break
            }
            if j == nCount - 1 {
                return i
            }
        }
    }
    return -1
}
