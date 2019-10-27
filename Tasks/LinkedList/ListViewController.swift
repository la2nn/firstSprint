//
//  ListViewController.swift
//  Tasks
//
//  Created by Спиридонов Николай on 27/10/2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var newElement: UITextField!
	@IBOutlet weak var numOfElementToDelete: UITextField!
	@IBOutlet weak var list: UILabel!
	

    override func viewDidLoad() {
        super.viewDidLoad()

        var list: LinkedList<Int> = [1, 2, 3]
        list.append(elements: [4, 5, 6])
        list.append(elements: [100, 200, 300])
        list.removeLast()
        list.removeElement(at: 1)
        list.forEach { print($0) }

    }
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
	
	@IBAction func addNewElement(_ sender: UIButton) {
	}
	@IBAction func deleteElement(_ sender: Any) {
	}
	
	@IBAction func printList(_ sender: Any) {
	}
	
	
}
