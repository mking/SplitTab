//
//  Owner.swift
//  SplitTab
//
//  Created by matt2 on 11/10/17.
//  Copyright © 2017 matt2. All rights reserved.
//

import Foundation

class Owner {
    var name: String
    var lineItems: [LineItem]
    
    var total: Decimal {
        get {
            return lineItems.map { l in l.cost }.reduce(Decimal(), +)
        }
    }
    
    init(name: String, lineItems: [LineItem]) {
        self.name = name
        self.lineItems = lineItems
    }
}
