import Foundation

// https://leetcode.com/problems/spiral-matrix-ii/
/*
 view image inside resources folder
 */
func generateMatrix(_ n: Int) -> [[Int]] {
    var c = [Int](repeating: 0, count: n)
    var mat = [[Int]](repeating: c, count: n)
    var left = 0, right = n - 1, top = 0, bottom = n - 1
    var val = 1
    var grid = n * n
    while val <= grid {
        // Fill every val in top row
        if left <= right && val <= grid {
            for c in left...right {
                mat[top][c] = val
                val += 1
            }
            top += 1
        }
        // Fill every val in right col
        if top <= bottom && val <= grid {
            for r in top...bottom {
                mat[r][right] = val
                val += 1
            }
            right -= 1
        }
        // Fill every val in bottom row (reverse order)
        if left <= right && val <= grid {
            for c in stride(from: right, through: left, by: -1) {
                mat[bottom][c] = val
                val += 1
            }
            bottom -= 1
        }
        // Fill every val in the left col (reverse order)
        if top <= bottom && val <= grid {
            for r in stride(from: bottom, through: top, by: -1) {
                mat[r][left] = val
                val += 1
            }
            left += 1
        }
    }
    return mat
}
//print(generateMatrix(4))
print(generateMatrix(3))
