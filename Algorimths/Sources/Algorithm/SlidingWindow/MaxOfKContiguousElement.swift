//
//  File.swift
//  Algorimths
//
//  Created by Nhat Le Tien on 20/2/25.
//

import Foundation
public func maxOfKTotalContiguousElement(list: [Int], k: Int) -> Int {
    var l = 0, r = k - 1
    var tottal = 0
    var maxValue = 0
    while r < list.count - 1 {
        if tottal == 0 {
            tottal = list[0...r].reduce(0, +)
            maxValue = tottal
        }
        l += 1
        r += 1
        tottal -= list[l]
        tottal += list[r]
        if tottal > maxValue {
            maxValue = tottal
        }
    }
    return maxValue
}


