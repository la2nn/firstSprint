//
//  Container.swift
//  Tasks
//
//  Created by Дарья Витер on 25/10/2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import Foundation

protocol Container {
    
    associatedtype T
    
    var size: Int { get }
    
    mutating func addElement (element: T)
    
    func atIndex(index: Int) -> T?
}

