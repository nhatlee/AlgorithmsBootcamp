import Foundation

///https://leetcode.com/problems/climbing-stairs/description/?envType=study-plan-v2&envId=top-interview-150
///
/*
 Example 1:

 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 Example 2:

 Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 */

// Fibonacies
func climbStairs(_ n: Int) -> Int {
    var one = 1
    var two = 1
    for i in stride(from: 0, to: n-1, by: 1) {
        var temp = one
        one = one + two
        two = temp
    }
    return one
}
