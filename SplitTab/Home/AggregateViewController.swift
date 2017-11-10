//
//  AggregateViewController.swift
//  SplitTab
//
//  Created by matt2 on 11/10/17.
//  Copyright © 2017 matt2. All rights reserved.
//

import UIKit

class AggregateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var ownerSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var tracker: Tracker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tracker = TrackerSingleton.instance
        populateOwners()
    }
    
    func populateOwners() {
        ownerSegmentedControl.removeAllSegments()
        for i in 0..<tracker.owners.count {
            ownerSegmentedControl.insertSegment(withTitle: tracker.owners[i].name, at: i, animated: false)
        }
        ownerSegmentedControl.selectedSegmentIndex = tracker.ownerIndex
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracker.aggregates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AggregateCell", for: indexPath) as! AggregateCell
        let aggregate = tracker.aggregates[indexPath.row]
        cell.setAggregate(aggregate: aggregate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    @IBAction func ownerChanged(_ sender: UISegmentedControl) {
        tracker.setOwnerIndex(ownerIndex: sender.selectedSegmentIndex)
        tableView.reloadData()
    }
}
