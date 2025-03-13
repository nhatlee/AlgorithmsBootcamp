//
//  Untitled.swift
//  
//
//  Created by Nhat Le Tien on 15/1/25.
//

public func bfs(tree: Node<Int>) -> [Int] {
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

public func dfs(tree: Node<Int>) -> [Int] {
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
