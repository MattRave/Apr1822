import UIKit


/**
 Generics:
 function
 struct/class
 protocols
 
 */

func makeArray<T>(input: T, inputTwo: T) -> [T] {
    return [input, inputTwo]
}

makeArray(input: 1, inputTwo: 3)                // [1,3]
makeArray(input: "philly", inputTwo: "boston")  // ["philly", "boston"]

func isEqual<T: Equatable>(input: T, inputTwo: T) -> Bool {
    return input == inputTwo // require the type to be Comparable (protocol)
}

isEqual(input: 1, inputTwo: 3)
isEqual(input: "one", inputTwo: "one")


struct Animal: Equatable {
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        return lhs.name == rhs.name
    }
    
    let name: String
    
}

isEqual(input: Animal(name: "a"), inputTwo: Animal(name: "a"))

func makeArray<T, U>(input: T, inputTwo: U) -> (T, U) {
    return (input, inputTwo)
}


struct Cat<T> {
    let name: T
}

let a = Cat(name: "aaa")
let b = Cat(name: "bbb")
let c = Cat(name: 12)

for letter in b.name {
    print(letter)
}

let cats: [Cat<String>] = [a,b]





// MARK: -- Stack
struct IntStack {
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct Stack<T> {
    var items: [T] = []
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}


