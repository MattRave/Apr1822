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
let primes: Set<Int> = [2, 3, 5, 7, 7, 7]
primes[primes.startIndex]
let odd: Set<Int> = [1,3,5,7,9]
/// Ordering of elements is random
    let mySet2 = Set([1,2,3,4,5])
    var mySet = Set([1,2,3,4,5])
/// Comparing two sets to each other
/// .union, .intersection, .subtract
let primePlusOdds = primes.union(odd)
let oddPrimes = primes.intersection(odd)
let arr = Array(oddPrimes)
let set = Set(arr)

// MARK: - Dictionary: Unordered, Unique Keys, Value can be anything

/// Subscripting into Dictionary always returns optional value
var dictionary: [String: Int] = [:]
dictionary["I"] = 1
dictionary["V"] = 5
dictionary["X"] = 10
/// Looping with (key, value)
for (key, value) in dictionary {
    print(value)
}
/// Looping using a tuple
for pair in dictionary {
    print(pair.value)
}

/// Using dictionary as a counter

var optionalNum: Int? = 10
if var optionalNum = optionalNum {
    optionalNum += 1
}
optionalNum

let romanStr = "VIIIVXV"
var counter = [Character: Int]()
for char in romanStr {
    if let num = counter[char] {
        counter[char] = num + 1
    } else {
        counter[char] = 1
    }
}
print(counter)
let value = counter["#"]

/// Reducing an array of string to a dictionary counter
///

let digits = [1,3,4,6]
let sum = digits.reduce(into: 0) { acummulation, nextValue in
    acummulation += nextValue
}
//let sum = digits.reduce(into: 0) { $0 += $1 }
print(sum)

let letters = ["a", "a", "b", "b", "c"]
let reducedCounter = letters.reduce(into: [:]) { accum, letter in
    accum[letter, default: 0] += 1
}
print(reducedCounter)

