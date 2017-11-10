//
//  HomeViewController.swift
//  SplitTab
//
//  Created by matt2 on 11/9/17.
//  Copyright © 2017 matt2. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var tracker: Tracker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tracker = TrackerSingleton.instance
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCategory" {
            let categoryViewController = segue.destination as! CategoryViewController
            categoryViewController.setCategories(categories: tracker.categories)
        }
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
    }
    
    func addLineItem(lineItem: LineItem) {
        tracker.personalOwner.lineItems.append(lineItem)
        tracker.ownerIndex = tracker.personalIndex
    }
}

