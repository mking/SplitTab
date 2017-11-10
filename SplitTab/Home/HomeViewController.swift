//
//  HomeViewController.swift
//  SplitTab
//
//  Created by matt2 on 11/9/17.
//  Copyright © 2017 matt2. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ownerSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionButton.layer.cornerRadius = actionButton.frame.height / 2
        updateBalance()
        
        ownerSegmentedControl.removeAllSegments()
        for i in 0..<BalanceSingleton.instance.owners.count {
            ownerSegmentedControl.insertSegment(withTitle: BalanceSingleton.instance.owners[i].name, at: i, animated: false)
        }
        setOwnerIndex(index: BalanceSingleton.instance.ownerIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCategory" {
            let categoryViewController = segue.destination as! CategoryViewController
            categoryViewController.setCategories(categories: BalanceSingleton.instance.categories)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BalanceSingleton.instance.aggregates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AggregateCell", for: indexPath) as! AggregateCell
        let aggregate = BalanceSingleton.instance.aggregates[indexPath.row]
        cell.setAggregate(aggregate: aggregate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    @IBAction func ownerChanged(_ sender: UISegmentedControl) {
        setOwnerIndex(index: sender.selectedSegmentIndex)
    }
    
    func setOwnerIndex(index: Int) {
        BalanceSingleton.instance.setOwnerIndex(index: index)
        ownerSegmentedControl.selectedSegmentIndex = index
        tableView.reloadData()
    }
    
    func updateBalance() {
        if BalanceSingleton.instance.balance < 0 {
            promptLabel.text = "You owe"
            costLabel.text = SharedConstants.currencyFormatter.string(from: NSDecimalNumber(decimal: -BalanceSingleton.instance.balance))
            actionButton.setTitle("Pay", for: .normal)
        } else {
            promptLabel.text = "You get back"
            costLabel.text = SharedConstants.currencyFormatter.string(from: NSDecimalNumber(decimal: BalanceSingleton.instance.balance))
            actionButton.setTitle("Request", for: .normal)
        }
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
    }
    
    func addLineItem(lineItem: LineItem) {
        BalanceSingleton.instance.personalOwner.lineItems.append(lineItem)
        setOwnerIndex(index: BalanceSingleton.instance.personalIndex)
        updateBalance()
    }
}

