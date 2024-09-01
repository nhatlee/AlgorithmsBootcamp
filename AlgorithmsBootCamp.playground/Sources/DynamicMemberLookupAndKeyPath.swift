import Foundation
import UIKit

struct Variety {
    let classification: String
    let type: WineType
    
    enum WineType {
        case red, white
    }
}

struct Winery {
    var name: String
    var country: String
}

@dynamicMemberLookup
struct Purchase {
    let winery: Winery
    let varierty: Variety
    let qty: Int
    
    subscript(dynamicMember keyPath: KeyPath<Winery, String>) -> String {
        winery[keyPath: keyPath]
    }
    
    subscript<T>(dynamicMember keyPath: KeyPath<Variety, T>) -> T {
        varierty[keyPath: keyPath]
    }
}

let sameplePurchase = Purchase(winery: Winery(name: "Road 13", country: "Canada"), varierty: Variety(classification: "Chardonary", type: .white), qty: 3)

print(sameplePurchase[keyPath: \.winery.name])
print(sameplePurchase.name)
print(sameplePurchase.country)

print(sameplePurchase.classification)
print(sameplePurchase.type)




@dynamicMemberLookup
struct Foo {
    subscript(dynamicMember bar: String) -> String {
        // Do what you need to do here with the param and return any
        // type specified on the function.
        return bar
    }
}

//https://medium.com/engineering-at-goodnotes/dynamic-member-lookup-in-swift-a-hidden-gem-7913c5a9ff40
let foo = Foo()
let anything: String = foo.anything
let anything2: String = foo.anything2
let anything3: String = foo.anything3


@dynamicMemberLookup
struct Cache {
    var storage: [String: Date] = [:]
    
    subscript(dynamicMember key: String) -> Date? {
        storage[key]
    }
}
var cache = Cache()
cache.storage = ["anything": Date.now]

print(cache.profile)


@dynamicMemberLookup
struct Person {
    subscript(dynamicMember member: String) -> (_ input: String) -> Void {
        return {
            print("Hello! I live at the address \($0).")
        }
    }
}

let taylor = Person()
taylor.printAddress("555 Taylor Swift Avenue")



let str = "Hello, Swift" as AnyObject
let bounds = str.bounds
let alignment = str.textAlignment

str.addSubview?(UIButton())


@dynamicMemberLookup
enum JSON {
   case intValue(Int)
   case stringValue(String)
   case arrayValue(Array<JSON>)
   case dictionaryValue(Dictionary<String, JSON>)

   var stringValue: String? {
      if case .stringValue(let str) = self {
         return str
      }
      return nil
   }

   subscript(index: Int) -> JSON? {
      if case .arrayValue(let arr) = self {
         return index < arr.count ? arr[index] : nil
      }
      return nil
   }

   subscript(key: String) -> JSON? {
      if case .dictionaryValue(let dict) = self {
         return dict[key]
      }
      return nil
   }

   subscript(dynamicMember member: String) -> JSON? {
      if case .dictionaryValue(let dict) = self {
         return dict[member]
      }
      return nil
   }
}

/*
 Without dynamic member look up you would need to navigate an instance of that JSON enum like this:

 json[0]?["name"]?["first"]?.stringValue
 But with dynamic member look up you can use this instead:

 json[0]?.name?.first?.stringValue
 */


let firstInteger = \Array<Int>.first
