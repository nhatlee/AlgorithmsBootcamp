
func letterCombinations(_ digits: String) -> [String] {
    guard !digits.isEmpty else { return [] }
    let digitsToLetters: [String: String] = [
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"
    ]
    var j = digits.count
    func strings(at idx: Int) -> [String] {
        let listDegit = Array(digits).map { String($0) }
        var degit = listDegit[idx]
        return Array(String(digitsToLetters[degit] ?? "")).map { String($0) }
    }
    
    
    var firsList = strings(at: 0)
    if j == 1 {
        return firsList
    }
    var i = 1
    var result = firsList
    while i < j {
        let nextList = strings(at: i)
        var r = [String]()
        var temp = result
        for v in temp {
            r = nextList.map { "\(v)\($0)" }
            result.removeAll(where: { $0 == v })
            result.append(contentsOf: r)
        }
        
        i += 1
    }
    return result
}
