//
//  LinkedListViewController.swift
//  Tasks
//
//  Created by Николай Спиридонов on 28.10.2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import UIKit

class LinkedListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var chooseIndexSegmented: UISegmentedControl!
    @IBOutlet weak var addElementButton: UIButton!
    @IBOutlet weak var elementField: UITextField!
    @IBOutlet weak var indexField: UITextField!

    typealias ListType = Double
    private var listDataSource = NumericDataSource<ListType>(items: [1, 2, 3, 4])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        addElementButton.layer.cornerRadius = addElementButton.frame.height / 3
    }

    @IBAction func addElementButtonTapped(_ sender: UIButton) {
        guard let insertIndex = Int(indexField.text ?? ""),
              let elementString = elementField.text else { return }
        
        let insertPlace: InsertPlace = chooseIndexSegmented.selectedSegmentIndex == 0 ? .before : .after
        
        listDataSource.insert(value: elementString,
                                     index: insertIndex,
                                     insertPlace: insertPlace)
        
        collectionView.reloadData()
    }
    
    @IBAction func removeHead(_ sender: UIButton) {
        guard listDataSource.linkedList.count != 0 else { sender.shake() ; return }
        collectionView.performBatchUpdates({
            collectionView.deleteItems(at: [IndexPath(row: 0, section: 0)])
            listDataSource.linkedList.removeElement(at: 0)
        }, completion: { _ in
            self.collectionView.reloadData()
        })
    }
    
    @IBAction func removeTail(_ sender: UIButton) {
        guard listDataSource.linkedList.count != 0 else { sender.shake() ; return }
        collectionView.performBatchUpdates({
            collectionView.deleteItems(at: [IndexPath(row: listDataSource.linkedList.count - 1,
                                                      section: 0)])
            listDataSource.linkedList.removeLast()
            
            guard let cell = self.collectionView.cellForItem(at: IndexPath(row: self.listDataSource.linkedList.count - 1, section: 0)) as? NodeCell else { return }
            UIView.animate(withDuration: 0.2) {
                cell.arrowsView.alpha = 0
            }
            
        }, completion: nil)
    }
}

extension LinkedListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listDataSource.linkedList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NodeIndentifier", for: indexPath) as! NodeCell
        guard let value = listDataSource.linkedList.getValue(at: indexPath.row) else { return cell }
        cell.valueLabel.text = String(value)
        cell.indexLabel.text = String(indexPath.row)
        cell.infoView.backgroundColor = #colorLiteral(red: 0.1170291379, green: 0.6328371167, blue: 0.951066196, alpha: 1)
        cell.infoView.layer.cornerRadius = cell.contentView.frame.height / 15
        
        if indexPath.row == listDataSource.linkedList.count - 1 {
            cell.arrowsView.alpha = 0
        } else {
            cell.arrowsView.alpha = 1
        }
        
        return cell
    }
    
}

public enum InsertPlace {
    case before
    case after
}
