import Foundation

/// https://leetcode.com/problems/merge-sorted-array/description/?envType=study-plan-v2&envId=top-interview-150
/// Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
/// Output: [1,2,2,3,5,6]
///
///
public func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var lastIdx = m + n - 1
    var mPointer = m
    var nPointer = n
    while mPointer > 0 && nPointer > 0 {
        if nums1[mPointer - 1] > nums2[nPointer - 1] {
            nums1[lastIdx] = nums1[mPointer - 1]
            mPointer -= 1
        } else {
            nums1[lastIdx] = nums2[nPointer - 1]
            nPointer -= 1
        }
        lastIdx -= 1
    }
    while nPointer > 0 {
        nums1[lastIdx] = nums2[nPointer - 1]
        nPointer -= 1
        lastIdx -= 1
    }
}
