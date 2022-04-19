import UIKit

// MARK: - Unwrapping Optionals

/// 1. Force Unwrap (worst method but easiest)

/// 2. Optional binding with if let or if var

/// Optional binding with guard let

/// 3. Nil coalescing (if you have a meaningful default value)

/// 4. Optional Chaining (allows to step into optional type to access its members)

/// 5. Implicitly unwrapped (implied force unwrapped, declared a forced optional)

/// 6. "switch" on optional variable for nil or value case (not commonly used)

// MARK: - Set: Unordered, no duplicates

/// Indexing into a set

/// Ordering of elements is random

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


