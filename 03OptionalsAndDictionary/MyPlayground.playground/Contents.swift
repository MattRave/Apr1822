import UIKit

// MARK: - Unwrapping Optionals
    let numbers = [1,2,3,4,5,6]
    
/// 1. Force Unwrap (worst method but easiest)
    numbers.first!
/// 2. Optional binding with if let or if var
    if let firstNumber = numbers.first {
        print(firstNumber)
    }
/// Optional binding with guard let
    func getFirstNumber() -> Int {
        guard let firstNumber = numbers.first else {
            return 0
        }
        return firstNumber
    }
    getFirstNumber()
/// 3. Nil coalescing (if you have a meaningful default value)
    var message: String?

    print("before assignment", message ?? "default message")
    message = "hello"
    print("after asignment", message ?? "default message")
/// 4. Optional Chaining (allows to step into optional type to access its members)
    var words = ["A", "the", "with", "who"]
    words.last?.capitalized
/// 5. Implicitly unwrapped (implied force unwrapped, declared a forced optional)
    var message2: String!
    message2 = "hey"

    
    print(message2.count)
    let message3: String = message2
    print(message3)
/// 6. "switch" on optional variable for nil or value case (not commonly used)
    switch message {
    case .some(let str):
        print(str)
    case .none:
        print("no value")
    }
// MARK: - Set: Unordered, no duplicates

/// Indexing into a set

/// Ordering of elements is random
    let mySet2 = Set([1,2,3,4,5])
    var mySet = Set([1,2,3,4,5])
/// Comparing two sets to each other
/// .union, .intersection, .subtract

// MARK: - Dictionary: Unordered, Unique Keys, Value can be anything

/// Subscripting into Dictionary always returns optional value

/// Looping with (key, value)

/// Looping using a tuple

/// Using dictionary as a counter

/// Reducing an array of string to a dictionary counter
let letters = ["a", "a", "b", "b", "c"]
let reducedCounter = letters.reduce(into: [:]) { accum, letter in
    accum[letter, default: 0] += 1
}


