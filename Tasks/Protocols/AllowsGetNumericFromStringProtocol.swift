//
//  AllowsGetNumericFromStringProtocol.swift
//  Tasks
//
//  Created by Николай Спиридонов on 02.11.2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import Foundation

protocol AllowsGetNumericFromString: Numeric {
    
    init?(_ string: String)
    
}
