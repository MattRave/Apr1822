import UIKit

// MARK: - Protocol

/// Protocol create requirements and ensure that those requirements WILL be met by any types adopting the protocol

protocol Movable {
    func move()
}
extension Movable {
    func move() {
        print("walking")
    }
}
struct Animal: Movable, Hashable {
    var numLegs: Int = 4
    var name: String
    
    func eat() {
        print("eating")
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
}

var car: Movable? = nil
car?.move()

var leo = Animal(name: "Leo")
leo.move()
leo.numLegs = 3

var simba = Animal(name: "simb")

if leo == simba {
    
}

/// Equatable, Comparable, Hashable
extension Animal: Equatable {
    static func ==(lhs: Animal, rhs: Animal) -> Bool {
        lhs.name == rhs.name
    }
}

extension Animal: Comparable {
    static func < (lhs: Animal, rhs: Animal) -> Bool {
        lhs.name < rhs.name
    }
}

//var zoo: [Animal: Int] = [:]
//zoo[leo] = 1
//zoo[simba] = 3
//zoo

/// Comparing structs with comparable

/// Protocol can be used as types:
struct Eagle: Movable {
    func move() {
        print("flying")
    }
}
let eagle = Eagle()
var zoo: [Movable] = [leo, simba]
zoo.append(eagle)
for animal in zoo {
    animal.move()
}

// MARK: - Extensions
/// Extensions can hold functions and computed properties (but not stored properties)
extension Animal {
    var canHunt: Bool {
        if numLegs % 4 == 0 {
            return true
        } else {
            return false
        }
    }
    func sleep() {
        print("sleeping")
    }
}
leo.sleep()
leo.canHunt

/// Extensions can be used to inherit protocols, but cannot inherit classes
class Plant {
    
}
class Rose {
    
}
//extension Rose: Plant {
//
//}
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
extension String {
    func myCount() -> Int{
        self.count + 2
    }
}

let nums = [1,2,3,4]
nums.safeIndex(index: -10)
"!@#$".myCount()

// MARK: - Computed Properties
/// Using computed properties to wrap private properties

class User {
    private var pin: Int = 1234
    var exposedPin: Int {
        get {
            return pin
        }
        set {
            if newValue > 999 && newValue < 10000 {
                pin = newValue
            }
//            exposedPin = newValue
        }
    }
    init(pin: Int) {
        self.pin = pin
    }
}

let user = User(pin: 1234)
print(user.exposedPin)
user.exposedPin = 3256
user.exposedPin
user.exposedPin = 1234512
user.exposedPin
