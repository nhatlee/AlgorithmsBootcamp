import Foundation
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

//extension ListNode: Hashable where Value: Hashable {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(value)
//        hasher.combine(children)
//    }
//}

public func dummyTreesData() {
    let nhat = ListNode("Nhat")
    let mo = ListNode("Mo")
    let cherry = ListNode("Cherry")
    nhat.add(child: mo)
    nhat.add(child: cherry)

    let dung = ListNode("Dung")
    let hoang = ListNode("Hoang")
    let be = ListNode("Be")
    dung.add(child: hoang)
    dung.add(child: be)

    let hanh = ListNode("Hanh")
    let viet = ListNode("Viet")
    let win = ListNode("Win")
    viet.add(child: win)
    let tuan = ListNode("Tuan")
    hanh.add(child: viet)
    hanh.add(child: tuan)
    
    
    let leChien = ListNode("Le Chien")
    leChien.add(child: nhat)
    leChien.add(child: dung)
    leChien.add(child: hanh)

    //In case struct then add here will no affect. Need to move it up
//    viet.add(child: ListNode("win"))
    
    print(nhat.count)
    print(leChien.count)

    print(leChien.find(value: "Dung")?.count)
    print()
    print("Is Hanh bigger than Nhat: \(hanh > nhat)")
    print("Is Dung equal to Nhat: \(dung <= nhat)")
    
    print("Parrent of Nhat:\(nhat.parent?.value)")
}

public func builerDummyTreesData() {
    let leChienBuilder = ListNode("Le Chien") {
        ListNode("Dung") {
            ListNode("Hoang")
            ListNode("Be")
        }
        ListNode("Hanh") {
            ListNode("Tuan")
            ListNode("Viet Anh") {
                ListNode("Win")
            }
        }
        ListNode("Nhat") {
            ListNode("Cherry")
            ListNode("Mo")
        }
    }


    print("leChienBuilder: ")
    print(leChienBuilder.count)
    print("Parrent of Win:\(leChienBuilder.findParent(of: "Win")?.value)")
    print("Parrent of Nhat:\(leChienBuilder.findParent(of: "Nhat")?.value)")
    print("Parrent of Mo:\(leChienBuilder.findParent(of: "Mo")?.value)")
    
}
