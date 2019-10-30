//
//  LinkedList.swift
//  Tasks
//
//  Created by Николай Спиридонов on 27.10.2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import Foundation

public struct LinkedList<T>: Sequence {
    
    indirect enum Node<T> {
        case node(value: T, next: Node<T>)
        case end
    }
    
    var head: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int {
        return self.map { $0 }.count
    }
    
    mutating func append(elements: LinkedList<T>) {
        var current = Node<T>.end
        for element in elements.reversed() {
            current = Node.node(value: element, next: current)
        }
        
        for element in self.reversed() {
            current = Node.node(value: element, next: current)
        }
        
        self.head = current
    }
    
    mutating func removeLast() {
        var current = Node<T>.end

        for (index, element) in self.reversed().enumerated() {
            if index == 0 { continue }
            current = Node.node(value: element, next: current)
        }
        
        self.head = current
    }
    
    var getTailValue: T? {
        return self.map { $0 }.last
    }
    
    var getHeadValue: T? {
        return self.map { $0 }.first
    }
    
    func getValue(at index: Int) -> T? {
        guard index < count else { return nil }
        return self.map { $0 }[index]
    }
    
    func getPreviousNode(with index: Int) -> (Node<T>)? {
        if index == 0 { return nil }
        let flatList = getFlatList
        return index < flatList.count ? flatList[index - 1] : nil
    }
    
    func getNextNode(with index: Int) -> (Node<T>)? {
        let flatList = getFlatList
        return index + 1 < flatList.count ? flatList[index + 1] : nil
    }
    
    var getFlatList: [Node<T>] {
        guard head != nil else { return [] }
        
        var tempContainer = [Node<T>]()
        var current = Node<T>.end
        
        for element in self.reversed() {
            current = Node.node(value: element, next: Node.end)
            tempContainer.append(current)
        }

        return tempContainer.reversed()
    }
    
    mutating func insert(elements: LinkedList<T>, at index: Int) {
        guard index < count else { return }
        
        var current = Node<T>.end
        for (i, element) in self.reversed().enumerated() {

            current = Node.node(value: element, next: current)
            if i == (self.count - 1) - index {
                for element in elements.reversed() {
                    current = Node.node(value: element, next: current)
                }
            }
        }
        
        self.head = current
    }
    
    mutating func removeElement(at index: Int) {
        guard index < count else { return }
        
        var current = Node<T>.end
        for (i, element) in self.reversed().enumerated() {
            if i == (self.count - 1) - index { continue }
            current = Node.node(value: element, next: current)
        }
        
        self.head = current
    }
    
    subscript(_ index: Int) -> T? {
        return getValue(at: index)
    }
    
    // MARK: - Sequence protocol supporting
    
    public func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(current: head ?? Node.end)
    }
 
    public struct LinkedListIterator<T>: IteratorProtocol {
        var current: Node<T>
        
        mutating public func next() -> T? {
            switch current {
            case let .node(element, nextNode):
                current = nextNode
                return element
            case .end:
                return nil
            }
        }
    }
    
}

// MARK: - ExpressibleByArrayLiteral protocol supporting

extension LinkedList: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        var current = Node<T>.end
        for element in elements.reversed() {
            current = Node.node(value: element, next: current)
        }
        self.head = current
    }
}
