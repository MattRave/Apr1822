import UIKit

var greeting = "Hello, "
///basic function syntax
func greet(){
    print(greeting)
}
greet()

/// function parameter syntax
func greetPerson(person: String){
    print("\(greeting)\(person)")
}
greetPerson(person:"luke")


/// functions can have both a parameter label and parameter name the label is what is seen when the function is called the name is what is used inside the body of the function
func greetPerson(named person: String){
    print("hello, \(person)")
}

/// when you return somthing from the an a function you must use this syntax and specify the type

func addNumbers(num1: Int, num2: Int) -> Int{
    num1 + num2
  // if the function is one line long you can ommit the return key word because it is implied
}




print(addNumbers(num1: 1, num2: 1))

///when you pass a value in as a parameter it because a contstant you can avoid this by adding the inout keyword before the type discription

func multiplyBy2(num: inout Int) -> Int{
    num *= 2
    return num
}

// if you create a inout parameter you can only pass in values that are already saved using the var key word
var myNum = 3

//when passing a value into an inout paramater you must prefrence it with an & symbol
multiplyBy2(num: &myNum)

//you can pass in a varied amount of parameters of the same type by adding three "." to the end of a paramaters value declaration

func addNumbers(numbers: Int...){
    var num = 0
    for number in numbers{
       num += number
    }
    print(num)
}
addNumbers(numbers: 1)
addNumbers(numbers: 1, 2)
/// you can return multiple values from a function by using tuples
func findMinMax(numbers: inout[Int]) -> (min: Int, max: Int){
    numbers.sort()
    let min = numbers.first!
    let max = numbers.last!
    
   return (min, max)
}
var arr = [1,4,2,4]

let tuple = findMinMax(numbers: &arr)

print("min: \(tuple.min), max: \(tuple.max)")

/// Arrays

let people = ["dave", "make", "leo"]

var animals: [String] = Array()

print(animals.isEmpty)

animals.append("tiger")
animals.append("bear")
animals.append("dog")

animals.insert("owl", at: 2)



animals.append(contentsOf: people)


animals.remove(at: 2)

/// creates an array of repeating values for a specified length
///
var vowels = Array(repeating: "a", count: 7)
/// you can also shorten this syntax by using $0 and removing the parenthesis
// EXAMPLE:
// let AnimalsThatStartWithD = animals.filter{
//$0.hasPrefix("d")}

let AnimalsThatStartWithD = animals.filter({
   animal in
    animal.hasPrefix("d")
    //we omit the return because it is implied
})


animals
animals[0] = "goat"


/// this is the short hand for
/// var newAnimals = animals.map({
///  animal  in
///   return "\(animal)!"
///})
var newAnimals = animals.map {
    "\($0)!"
}
print(newAnimals)

/// functions have types which are defined by their inputs and outputs
let newFunc: (Int, Int) -> Int


// you can pass a function as a parameter to a function

func addTwoNumbers(myFunc: (Int,Int) -> Int){
    myFunc(5, 6)
}



addTwoNumbers(myFunc: {
    return $0 + $1
})
/// once again we can shorten this more by removing the parenthesis and return  key word
///EXAMPLE:
//addTwoNumbers {
//    $0 + $1
//}
