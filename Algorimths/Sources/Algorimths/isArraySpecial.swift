//
//  isArraySpecial.swift
//  
//
//  Created by Nhat Le on 4/7/24.
//

public func isArraySpecial(_ nums: [Int]) -> Bool {
    guard nums.count > 1 else { return true }
    var i = 0
    var j = 1
    let count = nums.count
    while j < count {
        let pre = nums[i]
        let aft = nums[j]
        print("Checking: pre:\(pre) - aft:\(aft)")
        let preIsEvenNumber = pre % 2 == 0
        let aftIsEvenNumber = aft % 2 == 0
        if preIsEvenNumber == aftIsEvenNumber {
            return false
        }
        i += 1
        j += 1
    }
    return true
}
