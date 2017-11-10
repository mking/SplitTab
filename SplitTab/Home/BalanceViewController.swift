//
//  BalanceViewController.swift
//  SplitTab
//
//  Created by matt2 on 11/10/17.
//  Copyright © 2017 matt2. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var settleButton: UIButton!
    var tracker: Tracker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tracker = TrackerSingleton.instance
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    func updateViews() {
        promptLabel.text = tracker.balance < 0 ? "You owe" : "You get back"
        costLabel.text = SharedConstants.currencyFormatter.string(from: NSDecimalNumber(decimal: abs(tracker.balance)))
        
        settleButton.layer.cornerRadius = settleButton.frame.height / 2
        settleButton.setTitle(tracker.balance < 0 ? "Pay" : "Request", for: .normal)
    }
}
