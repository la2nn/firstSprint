//
//  QueueProtocol.swift
//  Tasks
//
//  Created by Vova SKR on 28/10/2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import UIKit

struct Queue<T>: Container {
    
    var container = [T]()
    
    var size: Int {
        return container.count
    }
    
    mutating func addElement(value: T) {
        container.append(value)
    }
    
    subscript(index: Int) -> T? {
        guard index >= 0, index < size else { return nil }
        return container[index]
    }
}
