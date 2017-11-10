//
//  LineItemCell.swift
//  SplitTab
//
//  Created by matt2 on 11/9/17.
//  Copyright © 2017 matt2. All rights reserved.
//

import UIKit

class LineItemCell: UITableViewCell {
    @IBOutlet weak var markerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    func setLineItem(lineItem: LineItem) {
        markerView.backgroundColor = lineItem.category.color
        nameLabel.text = lineItem.category.name
        costLabel.text = SharedConstants.currencyFormatter.string(from: NSDecimalNumber(decimal: lineItem.cost))
    }
}

