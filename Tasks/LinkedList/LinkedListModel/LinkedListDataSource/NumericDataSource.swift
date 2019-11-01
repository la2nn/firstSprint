//
//  NumericDataSource.swift
//  Tasks
//
//  Created by Николай Спиридонов on 01.11.2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import Foundation

class NumericDataSource<T: AllowsGetNumericFromString>: LinkedListInsertMethodProtocol {
   
    var linkedList: LinkedList<T>
    
    func insert(value: String, index: Int, insertPlace: InsertPlace) {
        guard let value = T(value) else { return }
        
        if linkedList.isEmpty {
            linkedList = [value]
            return
        }
        
        switch insertPlace {
        case .before: linkedList.insert(elements: [value], before: index)
        case .after: linkedList.insert(elements: [value], after: index)
        }
    }
    
    init(items: LinkedList<T>) {
        self.linkedList = items
    }
    
}
