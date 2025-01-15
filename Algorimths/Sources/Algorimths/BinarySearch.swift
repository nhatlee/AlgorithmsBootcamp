import Foundation

public func binarySearch(list: [Int], target: Int) -> Int? {
    var right = list.count - 1
    var left = 0
    while left <= right {
        let mid = (left + right)/2
        print("Mid:\(mid)")
        if list[mid] == target {
            return mid
        } else if list[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return nil
}
