import UIKit

var greeting = "Hello 🥸"
greeting += " Luke"

let firstStringIndex = greeting.startIndex
greeting[firstStringIndex]

let fifthIndex = greeting.index(firstStringIndex, offsetBy: 4)
print("First index: ", greeting[firstStringIndex])  // word[0]
print(greeting)

print("Fifth index: ", greeting[fifthIndex])  // word[4]

for letter in greeting {
    print(letter)
}

for (offset, value) in greeting.enumerated() {
    print("Offset: \(offset),Value: \(value) ")
}

greeting.forEach { letter in
    print(letter)
}

var num: Double = 12.12345678901234567890
var float: Float = 12.12141238

if num > 5 {
    print("more than 5")
} else {
    print("less than or equal 5")
}

num > 5 ? print("more than 5") : print("less than or equal 5")


for num in (0..<12) {
    let index = greeting.index(firstStringIndex, offsetBy: num)
    print(greeting[index])
}
greeting.replacingOccurrences(of: "o", with: "i")
greeting.firstIndex(of: "H")
greeting.split(separator: " ")
let hasH = greeting.contains { letter in
    letter == "H"
}
print(hasH)

print(greeting.count)
