//
//  Aggregate.swift
//  SplitTab
//
//  Created by matt2 on 11/10/17.
//  Copyright © 2017 matt2. All rights reserved.
//

import Foundation

class Aggregate {
    var category: Category
    var cost: Decimal
    
    init(category: Category, cost: Decimal) {
        self.category = category
        self.cost = cost
    }
}
