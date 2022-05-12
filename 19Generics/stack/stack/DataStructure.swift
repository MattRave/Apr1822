//
//  DataStructure.swift
//  stack
//
//  Created by Luat on 5/12/22.
//

import Foundation

struct Stack<Element> {
    var items: [Element] = []
    var count: Int {
        items.count
    }
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    mutating func clear() {
        return items = []
    }
}
extension Stack: CustomStringConvertible {
    var description: String {
        var result = ""
        for (offset, item) in items.reversed().enumerated() {
            result += "\(items.count - offset): \(item)\n"
        }
        return result
    }
}


struct Queue<T> {
    private var elements: [T] = []
    
    mutating func enqueue(_ value: T) {
        elements.append(value)
    }
    
    mutating func dequeue() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
    
    var head: T? {
        return elements.first
    }
    
    var tail: T? {
        return elements.last
    }
}
