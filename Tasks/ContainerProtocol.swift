//
//  Container.swift
//  Tasks
//
//  Created by Дарья Витер on 25/10/2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import Foundation

protocol Container {
	associatedtype Item
	
	var count : Int {get}
	
	mutating func appendElement(_ element: Item)
	
	subscript(i: Int) -> Item {get}
}
