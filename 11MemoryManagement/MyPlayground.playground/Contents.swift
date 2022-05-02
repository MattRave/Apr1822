import UIKit

var greeting = "Hello, playground"

class Dog {
    var name: String
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is deallocating")
    }
}

func refType(input: Dog?) {
    
    let fido = input // ref 3: fido.name
    fido?.name = "fedo"
    print(fido?.name)
    
} // remove fido and input: // ref: 1

var fido: Dog? = Dog(name: "fido") // ref: 1
fido?.name
refType(input: fido) // ref: 2 input.name


//var myDog = fido // ref: 2

fido = nil  // decrease ref by 1

// ARC: automatic reference counting


class Person {
    var name: String
    var cc: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is deallocating")
    }
}

let personA = Person(name: "a") // ref: 1
let personB = personA           // ref: 2

func someting() {
    let personC = personA           // ref: 3
}

someting()
// end of func, ref: 2


class CreditCard {
    weak var owner: Person?     // doesn't increment the ref count
    unowned var dog: Dog        // doesn't increment the ref count
    var balance: Int = 0
    init(dog: Dog?) {
        self.dog = dog!
    }
    deinit {
        print("credit card is deallocating")
    }
}
let potato = Dog(name: "potato")

var luke: Person? = Person(name: "luke")                // luke's ref: 1
var visa: CreditCard? = CreditCard(dog: potato)         // visa's ref: 1

luke?.cc = visa                  // visa's ref: 2
//visa.balance
//luke.cc?.balance
visa?.owner = luke               // luke's ref 2, IF weak var owner, then ref: 1

luke = nil                       // luke's ref: 1, IF weak var owner, then ref: 0
visa = nil                       // visa ref: 1, IF weak var owner, then ref: 0
print(luke?.cc)
print(visa?.owner)
// retain cycle (strong ref cycle), memory leak
// fix with "weak" or "unowned": both do not increase the ref count

class ViewController {
    
    var data: String = ""
    
    func fetchData() {
        // common cause of a memory leak
        DispatchQueue.global().asyncAfter(deadline: .now() + 100) { [weak self] in
            self?.data = "asdff"
        }
    }
    
    deinit {
        print("deinit")
    }
    
}
