//
//  Protocol.swift
//  Tasks
//
//  Created by Vova SKR on 29/10/2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import Foundation

protocol Container {
    
    associatedtype Item
    
    var size: Int { get }
    
    mutating func addElement (value: Item)
    
    subscript(index: Int) -> Item? { get }
}
