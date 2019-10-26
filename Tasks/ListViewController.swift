//
//  ListViewController.swift
//  Tasks
//
//  Created by Дарья Витер on 25/10/2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var newElement: UITextField!
	@IBOutlet weak var numOfElementToDelete: UITextField!
	@IBOutlet weak var list: UILabel!
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
	
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
