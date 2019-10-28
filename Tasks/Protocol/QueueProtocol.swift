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
    
    mutating func addElement(element: T) {
        container.append(element)
    }
    
    func atIndex(index: Int) -> T? {
        
        guard index >= 0, index < size else { return nil }
        var i = 0
        var newContainer = container
        while i != index {
            newContainer.remove(at: 0)
            i += 1
        }
        return newContainer[0]
    }
}
