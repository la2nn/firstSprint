//
//  LinkedList.swift
//  Tasks
//
//  Created by Vova SKR on 28/10/2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import UIKit

struct LinkedListProtocol<T>: Container {
    
    
    indirect enum Node<T> {
        case value(element: T, next: Node<T> )
        case end
    }
    
    var head: Node<T>?
    
    var size: Int {
        return self.map {$0}.count
    }
    
    mutating func addElement(element: T) {
        var newNode = Node<T>.end
        newNode = Node<T>.value(element: element, next: newNode)
        for item in self {
            newNode = Node.value(element: item, next: newNode)
        }
        self.head = newNode
    }
    
    
    func atIndex(index: Int) -> T? {
        guard index >= 0, index < size else { return nil }
        return self.map {$0}[index]
    }
    
    
    struct Iterator<T>: IteratorProtocol {
        var current: Node<T>
        
        mutating func next() -> T? {
            switch current {
            case let .value(element, next):
                current = next
                return element
            case .end: return nil
            }
        }
    }
}

extension LinkedListProtocol: Sequence {
    public func makeIterator() -> Iterator<T> {
        return Iterator(current: head ?? Node.end)
    }
}
