//
//  LineItemViewController.swift
//  SplitTab
//
//  Created by matt2 on 11/9/17.
//  Copyright © 2017 matt2. All rights reserved.
//

import UIKit

class LineItemViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var costField: UITextField!
    var category: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = category.name
        circleView.layer.cornerRadius = circleView.frame.height / 2
        circleView.backgroundColor = category.color
    }
    
    func setCategory(category: Category) {
        self.category = category
    }
}
