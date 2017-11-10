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
    
    let categories = [
        Category(name: "Electricity", color: SharedConstants.purple),
        Category(name: "Internet", color: SharedConstants.blue),
        Category(name: "Gas", color: SharedConstants.green),
        Category(name: "Food", color: SharedConstants.orange),
        Category(name: "Home Supplies", color: SharedConstants.yellow),
        Category(name: "Water", color: SharedConstants.lightBlue),
        Category(name: "Rent", color: SharedConstants.lightGreen),
    ]
    
    var lineItems = [LineItem]()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        lineItems = [
            LineItem(category: categories[4], cost: SharedConstants.currencyFormatter.number(from: "$19.57")!.decimalValue),
            LineItem(category: categories[2], cost: SharedConstants.currencyFormatter.number(from: "$58.17")!.decimalValue),
            LineItem(category: categories[0], cost: SharedConstants.currencyFormatter.number(from: "$15.27")!.decimalValue),
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        promptLabel.text = "You owe"
        costLabel.text = SharedConstants.currencyFormatter.string(from: NSDecimalNumber(decimal: Decimal()))
        actionButton.layer.cornerRadius = actionButton.frame.height / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCategory" {
            let categoryViewController = segue.destination as! CategoryViewController
            categoryViewController.setCategories(categories: categories)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lineItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LineItemCell", for: indexPath) as! LineItemCell
        let lineItem = lineItems[indexPath.row]
        cell.setLineItem(lineItem: lineItem)
        return cell
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
    }
    
    func addLineItem(lineItem: LineItem) {
        lineItems.append(lineItem)
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: lineItems.count - 1, section: 0)], with: .none)
        tableView.endUpdates()
    }
}

