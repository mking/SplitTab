//
//  CategoryViewController.swift
//  SplitTab
//
//  Created by matt2 on 11/9/17.
//  Copyright © 2017 matt2. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!

    let categories = [
        Category(name: "Electricity", color: UIColor.purple),
        Category(name: "Internet", color: UIColor.blue),
        Category(name: "Gas", color: UIColor.green),
        Category(name: "Food", color: UIColor.orange),
        Category(name: "Home Supplies", color: UIColor.yellow),
        Category(name: "Water", color: UIColor.blue),
        Category(name: "Rent", color: UIColor.green),
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        let category = categories[indexPath.row]
        cell.setCategory(category: category)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowLineItem" {
            let lineItemViewController = segue.destination as! LineItemViewController
            let category = categories[collectionView.indexPathsForSelectedItems!.first!.row]
            lineItemViewController.setCategory(category: category)
        }
    }
}
