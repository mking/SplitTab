//
//  Tracker.swift
//  SplitTab
//
//  Created by matt2 on 11/10/17.
//  Copyright © 2017 matt2. All rights reserved.
//

import Foundation

class Tracker {
    var categories = [Category]()
    var owners = [Owner]()
    var ownerIndex = 0
    var otherIndex = 0
    var personalIndex = 1
    
    var owner: Owner {
        get {
            return owners[ownerIndex]
        }
    }
    
    var aggregates: [Aggregate] {
        get {
            return getAggregates(owner: owner)
        }
    }
    
    var otherOwner: Owner {
        get {
            return owners[otherIndex]
        }
    }
    
    var personalOwner: Owner {
        get {
            return owners[personalIndex]
        }
    }
    
    var balance: Decimal {
        get {
            return personalOwner.total - otherOwner.total
        }
    }
    
    init() {
        categories = [
            Category(name: "Electricity", color: SharedConstants.purple),
            Category(name: "Internet", color: SharedConstants.blue),
            Category(name: "Gas", color: SharedConstants.green),
            Category(name: "Food", color: SharedConstants.orange),
            Category(name: "Home Supplies", color: SharedConstants.yellow),
            Category(name: "Water", color: SharedConstants.lightBlue),
            Category(name: "Rent", color: SharedConstants.lightGreen),
        ]
        
        owners = [
            Owner(name: "Your expenses", lineItems: [
                LineItem(category: categories[4], cost: SharedConstants.currencyFormatter.number(from: "$19.57")!.decimalValue),
                LineItem(category: categories[2], cost: SharedConstants.currencyFormatter.number(from: "$58.17")!.decimalValue),
                LineItem(category: categories[0], cost: SharedConstants.currencyFormatter.number(from: "$15.27")!.decimalValue),
                ]),
            Owner(name: "You spent", lineItems: []),
        ]
    }
    
    func setOwnerIndex(ownerIndex: Int) {
        self.ownerIndex = ownerIndex
    }
    
    func getAggregates(owner: Owner) -> [Aggregate] {
        var costs = [String: Decimal]()
        for lineItem in owner.lineItems {
            costs[lineItem.category.name] = (costs[lineItem.category.name] ?? 0) + lineItem.cost
        }
        return categories
            .filter { c in costs[c.name] != nil }
            .map { c in Aggregate(category: c, cost: costs[c.name]!) }
    }
}
