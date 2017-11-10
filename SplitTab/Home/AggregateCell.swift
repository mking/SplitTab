//
//  AggregateCell.swift
//  SplitTab
//
//  Created by matt2 on 11/9/17.
//  Copyright © 2017 matt2. All rights reserved.
//

import UIKit

class AggregateCell: UITableViewCell {
    @IBOutlet weak var markerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    func setAggregate(aggregate: Aggregate) {
        markerView.backgroundColor = aggregate.category.color
        nameLabel.text = aggregate.category.name
        costLabel.text = SharedConstants.currencyFormatter.string(from: NSDecimalNumber(decimal: aggregate.cost))
    }
}

