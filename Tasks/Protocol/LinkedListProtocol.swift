//
//  LinkedListProtocol.swift
//  Tasks
//
//  Created by Vova SKR on 30/10/2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import UIKit

final class Node<T> {
    
    let value: T
    var nextNode: Node?
    
    init(value: T, nextNode: Node? = nil) {
        self.value = value
        self.nextNode = nextNode
    }
}

final class LinkedListProtocol<T>: Container {
    
    var head: Node<T>?
    
    init(head: Node<T>? = nil) {
        self.head = head
    }
    
    var size: Int {
        return self.map {$0}.count
    }
    
    func addElement(value: T) {
        let newNode = Node(value: value, nextNode: nil)
        guard var head = head else { self.head = newNode; return }
        while let next = head.nextNode { head = next }
        head.nextNode = newNode
    }
    
    subscript(index: Int) -> T? {
        return self.map {$0}[index]
    }
}

 // MARK: Extension

extension LinkedListProtocol: Sequence {
    func makeIterator() -> Iterator<T> {
        return Iterator(current: head)
    }
}

 // MARK: Iteratoe

struct Iterator<T>: IteratorProtocol {
    typealias Element = T
    
    var current: Node<T>?
    
    mutating func next() -> Iterator<T>.Element? {
        guard let current = current else { return nil }
        let value = current.value
        self.current = current.nextNode
        return value
    }
}
