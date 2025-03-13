//
//  Test.swift
//  Algorimths
//
//  Created by Nhat Le Tien on 15/1/25.
//

import Testing
@testable import Algorimths
//https://developer.apple.com/documentation/testing/migratingfromxctest
struct SpiralMatrixIITest {

    @Test("Generate Matrix")
    func generateAMatrix() async throws {
        let expected = [[1, 2, 3, 4], [12, 13, 14, 5], [11, 16, 15, 6], [10, 9, 8, 7]]
        #expect(generateMatrix(4) == expected)
    }

}
