//
//  CategoryCell.swift
//  SplitTab
//
//  Created by matt2 on 11/9/17.
//  Copyright © 2017 matt2. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var circleView: UIView!
    
    func setCategory(category: Category) {
        nameLabel.text = category.name
        circleView.layer.cornerRadius = circleView.frame.height / 2
        circleView.backgroundColor = category.color
    }
}
