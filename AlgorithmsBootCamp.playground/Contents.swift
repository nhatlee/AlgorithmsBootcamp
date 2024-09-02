import UIKit
import Foundation



//func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
//  var res = [[Int]]()
//  var cur = [Int]()
//  func dfs(i: Int, cur: inout [Int], total: Int) {
//    print("current i:\(i) - cur: \(cur) - res:\(res) - total:\(total)")
//    if total == target {
//      var curCopy = cur
//      res.append(curCopy)
//      return
//    }
//    if i >= candidates.count || total > target {
//      return
//    }
//    
//    cur.append(candidates[i])
//    dfs(i: i, cur: &cur, total: total + candidates[i])
//    cur.removeLast()
//    dfs(i: i + 1, cur: &cur, total: total)
//  }
//  dfs(i: 0, cur: &cur, total: 0)
//  print(res)
//  return res
//}
//combinationSum([2,3,6,4,7], 9)
//combinationSum([2,3,5], 11)

//combinationSum([1,0,-1,0,-2,2], 0)



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

final class ListNode<Value> {
    
    var value: Value
    /// If use struct for ListNode. Error:
    /// Value type 'ListNode<Value>' cannot have a stored property that recursively contains it
    var parent: ListNode?
    var children: [ListNode]
    
    var count: Int {
        1 + children.reduce(0) { return $0 + $1.count }
    }
    
    init(_ value: Value) {
        self.value = value
        children = []
    }
    
    init(value: Value, children: [ListNode]) {
        self.value = value
        self.children = children
    }
    
    init(_ value: Value, @ListNodeBuilder builder: () -> [ListNode]) {
        self.value = value
        children = builder()
        children.forEach({ $0.parent = ListNode(value) })
    }
    
    func add(child: ListNode) {
        children.append(child)
    }
}

@resultBuilder
struct ListNodeBuilder {
    static func buildBlock<Value>(_ children: ListNode<Value>...) -> [ListNode<Value>] {
        children
    }
}

extension ListNode: Equatable where Value: Equatable {
    static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.value == rhs.value && lhs.children == rhs.children
    }
}

extension ListNode where Value: Equatable {
    func find(value: Value) -> ListNode? {
        if self.value == value {
            return self
        }
        for child in children {
            if let match = child.find(value: value) {
                return match
            }
        }
        return nil
    }
    
    func findParent(of value: Value) -> ListNode? {
        find(value: value)?.parent
    }
}

extension ListNode: Comparable where Value: Comparable {
    static func < (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.count < rhs.count
    }
}
typealias Node = ListNode
let numberTrees = Node(1) {
    Node(2) {
        Node(5)
        Node(6)
    }
    Node(4)
    Node(3) {
        Node(12)
    }
}
print(numberTrees.count)


func bfs(tree: Node<Int>) -> [Int] {
    var result = [Int]()
    var queueTree = [tree]
    while !queueTree.isEmpty {
        // FIFO: Remove the first entry
        let current = queueTree.remove(at: 0)
        result.append(current.value)
        for child in current.children {
            queueTree.append(child)
        }
    }
    return result
}

print("Resolved by BFS: \(bfs(tree: numberTrees))")

func dfs(tree: Node<Int>) -> [Int] {
    var stackResult = [Int]()
    var stackTree = [tree]
    
    while !stackTree.isEmpty {
        // Remove the last one added O(1)
        //LIFO
        let current = stackTree.removeLast()
        stackResult.append(current.value)
        for child in current.children {
            stackTree.append(child)
        }
    }
    return stackResult
}

print("Resolved by dfs: \(dfs(tree: numberTrees))")
