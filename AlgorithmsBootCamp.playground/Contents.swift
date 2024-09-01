import UIKit
import Foundation
/*
 Example 1:

 Input: candidates = [2,3,6,7], target = 7
 Output: [[2,2,3],[7]]
 Explanation:
 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
 7 is a candidate, and 7 = 7.
 These are the only two combinations.
 Example 2:

 Input: candidates = [2,3,5], target = 8
 Output: [[2,2,2,2],[2,3,3],[3,5]]
 Example 3:

 Input: candidates = [2], target = 1
 Output: []
  

 Constraints:

 1 <= candidates.length <= 30
 2 <= candidates[i] <= 40
 All elements of candidates are distinct.
 1 <= target <= 40
 */

//func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
//  var result = [[Int]]()
//  for candidate in candidates {
//    let surplus = target%candidate
//    if surplus == 0 {
//      result.append(divisibleList(target: target, candidate: candidate))
//    }
//    if candidates.contains(surplus) {
//      result.append(surplusList(candidate, target: target, surplus: surplus))
//    }
//  }
//  print(result)
//  return result
//}
//
//func surplusList(_ candidate: Int, target: Int, surplus: Int) -> [Int] {
//  var list = [surplus]
//  let nums = target/candidate
//  for _ in 0..<nums {
//    list.append(candidate)
//  }
//  return list
//}
//
//func divisibleList(target: Int, candidate: Int) -> [Int] {
//  var list = [Int]()
//  let nums = target/candidate
//  for _ in 0..<nums {
//    list.append(candidate)
//  }
//  return list
//}
//
//combinationSum([2,3,6,7], 7)

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
  var res = [[Int]]()
  var cur = [Int]()
  func dfs(i: Int, cur: inout [Int], total: Int) {
    print("current i:\(i) - cur: \(cur) - res:\(res) - total:\(total)")
    if total == target {
      var curCopy = cur
      res.append(curCopy)
      return
    }
    if i >= candidates.count || total > target {
      return
    }
    
    cur.append(candidates[i])
    dfs(i: i, cur: &cur, total: total + candidates[i])
    cur.removeLast()
    dfs(i: i + 1, cur: &cur, total: total)
  }
  dfs(i: 0, cur: &cur, total: 0)
  print(res)
  return res
}
//combinationSum([2,3,6,4,7], 9)
//combinationSum([2,3,5], 11)

//combinationSum([1,0,-1,0,-2,2], 0)


func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
  let matrixCount = arr.count
  var leftSide = 0
  var rightSide = 0
  for i in 0..<matrixCount {
    leftSide += arr[i][i]
    rightSide += arr[i][matrixCount-1-i]
  }
  return abs(leftSide-rightSide)
}

//print(diagonalDifference(arr: [[11, 2, 4], [4, 5, 6], [10, 8, -12]]))
/*
 Example

 There are  elements, two positive, two negative and one zero. Their ratios are ,  and . Results are printed as:
 */
func plusMinus(arr: [Int]) -> Void {
    // Write your code here
  var negativeCounter: Decimal = 0
  var positiveCounter: Decimal = 0
  var zeroCounter: Decimal = 0
  for v in arr {
    if v == 0 {
      zeroCounter += 1
    }else if v < 0 {
      negativeCounter += 1
    } else {
      positiveCounter += 1
    }
  }
  let elements = Decimal(arr.count)
  func formattedString(_ number: Decimal) -> String {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 6
    formatter.maximumFractionDigits = 6
    return formatter.string(from: number as NSDecimalNumber)!
    
  }
//  [
//  print(formattedString(positiveCounter/elements))
//  print(formattedString(negativeCounter/elements))
//  print(formattedString(zeroCounter/elements))
//  ].sorted{ $0 > $1 }.forEach{
//    print($0)
//  }
}

//func staircase(n: Int) -> Void {
//  for i in 0..<n {
//    var chars = [Character]()
//    let whiteSpace = n - i - 1
//    for _ in 0..<whiteSpace {
//      chars.append(" ")
//    }
//    for _ in 0...i {
//      chars.append("#")
//    }
//    print(String(chars))
//  }
//}
//staircase(n: 4)
//func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
//    var counter = 0
//    for v in arr {
//        if v % 2 == 0 {
//            counter = 0
//        } else {
//            counter += 1
//        }
//        if counter == 3 {
//            return true
//        }
//    }
//    return counter == 3
//}
//let list1 = [2,6,4,1]
//threeConsecutiveOdds(list1)
//
//let l2 = [1,2,34,3,4,5,7,23,12]
//threeConsecutiveOdds(l2)



// MARK: - letterCombinations
//print(letterCombinations("234"))
/*
 ["adg","adh","adi","aeg","aeh","aei","afg","afh","afi","bdg","bdh","bdi",
 "beg","beh","bei","bfg","bfh","bfi","cdg","cdh","cdi","ceg","ceh","cei","cfg","cfh","cfi"]
 */
//print(letterCombinations("23"))
//print(letterCombinations("2"))
//print(letterCombinations(""))


// MARK: - isArraySpecial
//isArraySpecial([1])
//isArraySpecial([2,1,4])
//isArraySpecial([4,3,1,6])
//isArraySpecial([4,3,2,3])


// MARK: - MergeSortedArray
//var num1 = [1,2,3,0,0,0, 0, 0, 0]
//merge(&num1, 3, [2,5,6,7, 8, 9], 6)
//print(num1)
//
//
//var num2 = [2,2,3,0,0,0]
//merge(&num2, 3, [1,2,2], 3)
//print(num2)
//
//
//var num3 = [2,3,0,0,0]
//merge(&num3, 2, [1,2,4], 3)
//print(num3)



// MARK: RemoveElement

//var nums = [3,2,2,3]
//let k = removeElement(&nums, 3)
//print(nums)
//print(k)



// MARK: - Remove Duplicates
//var nums = [1,1,2]//[0,0,1,1,1,2,2,3,3,4]
//let k = removeDuplicates(&nums)
//print(nums)
//print(k)


// MARK:  Find the Index of the First Occurrence in a String
//let r = strStr("saobutsad", "sad")
//print(r)
////"leetcode", needle = "leeto"
//let r2 = strStr("leetcode", "co")
//print(r2)
//
//let r3 = strStr("leetcodev", "eetc")
//print(r3)


// MARK: -isPalindrome

//isPalindrome("A man, a plan, a canal: Panama")

//for i in stride(from: 0, to: 2, by: 1) {
//    print("i:\(i)")
//}
//print()
//for j in stride(from: 0, through: 2, by: 1) {
//    print("j:\(j)")
//}


// MARK: - climbStairs

//climbStairs(2)
//climbStairs(3)


//func mid(left: Int, right: Int) {
//    let mid = left + (right - left)/2
//    print("Mid:\(mid)")
//}
//
//mid(left: 0, right: 7)
//mid(left: 1, right: 7)
//mid(left: 2, right: 7)
//mid(left: 2, right: 6)


//13
//
//
//1,3,5,7,9,11,13


// MARK: - binarySearch
//let duration = ContinuousClock().measure {
//    binarySearch(list: [1,3,5,7,9,11,13], target: 5)
//}
//print("duration:\(duration)")
//binarySearch(list: [], target: 1)
//binarySearch(list: [1], target: 1)



