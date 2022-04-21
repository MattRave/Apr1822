import UIKit

// MARK: - Class

/// 1) Class: can hold properties and methods
/// Properties: stored properties (or computed properties)
/// Methods: declare with func keyword, parameters, and return value

class Vehicle{
    init(numberOfWheels: Int = 4 ){
        self.numberOfWheels = numberOfWheels
    }
    init(){
        self.numberOfWheels = 2
    }
    let numberOfWheels: Int
    func drive(){
        print("car is drinving")
    }
}
let vehicle = Vehicle(numberOfWheels: 4)

//class Car: Vehicle{
//
//    init(make: String, model: String) {
//        self.make = make
//        self.model = model
//    }
//    var make: String
//    var model: String
//}
//let car = Car(make: "chevy", model: "explorer")


/// 2) Static vs Instances
/// Static property lives on the class type itself
/// Instance property lives on an instance/object of the class
class DataManager{
    static let shared = DataManager()
    let data =  112097412
    func saveData(){
        print("your data was saved: \(data)")
    }
}
class Movie{
    init(title: String, length: Int){
        self.title = title
        self.length = length
        Movie.count += 1
        
    }
    static var count = 0
    let title: String
    let length: Int
}
let movie = Movie(title: "e", length: 2312)
let movie2 = Movie(title: "we", length: 212)
let movie3 = Movie(title: "weq", length: 232)

print(Movie.count)
/// 3) Class are reference type
class Box{
    
    var broken = false
}

let box = Box()
let box2 = box
box2.broken = true
print(box.broken)

let num = 3
var num2 = num
num2 = 4
print(num)
/// 4) Classes can use inheritance
/// Override functions
class Bike: Vehicle{
    override func drive() {
        print("youre riding your bike")
    }
    var hasBasket: Bool?
}

let bike = Bike(numberOfWheels: 2)
bike.hasBasket = true
bike.drive()

/// 5) Initializing A Class
/// Properties without initial values needs to be given a value by an initializer
/// Optional properties are automatically set to nil
/// Can have multiple init functions


// MARK: - Struct
struct Boat{
    var hasFlag = true
    mutating func removeFlag(){
        self.hasFlag = false
    }
    var color: String
    var size: String
}

struct Yaht{
    
}
var boat = Boat(color: "blue", size: "big")
var boat2 = boat
boat2.hasFlag = false
//print(boat2.hasFlag)
//print(boat.hasFlag)
print(boat.hasFlag)

/// 1) same as class
/// 2) same as class

/// 3) Structs are value type

/// 3b) Structs are immutable by default, have to use keyword "mutating" to change properties
    
/// 4) Structs does not have OOP inheritances, uses protocol inheritance/conformance

/// 5) auto-generated initializer, don't have to write init func


// MARK: - Summary
/// What is a Value Type?
/// Struct: faster and more performant
/// - accessed in "stack" memory (faster)
/// - classes/references lives in "heap" memory (look up time)
/// value type: passed by copy
/// Copy-on-write
/// When changed, needs to be var (not let)
