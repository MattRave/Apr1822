import UIKit

// MARK: - Protocol

/// Protocol create requirements and ensure that those requirements WILL be met by any types adopting the protocol

/// Equatable, Comparable, Hashable

/// Comparing structs with comparable

/// Protocol can be used as types:

// MARK: - Extensions

/// Extensions can hold functions and computed properties (but not stored properties)

/// Extensions can be used to inherit protocols, but cannot inherit classes

/// Extending built-in types
extension Array {
    func safeIndex(index: Int) -> Element? {
        if index > 0 && index < self.count {
            return self[index]
        } else {
            return nil
        }
    }
}


// MARK: - Computed Properties
/// Using computed properties to wrap private properties

