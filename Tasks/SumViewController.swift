//
//  ViewController.swift
//  Tasks
//
//  Created by Дарья Витер on 25/10/2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import UIKit

class SumViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var firstNumber: UITextField!
	@IBOutlet weak var secondNumber: UITextField!
	@IBOutlet weak var totalSum: UITextField!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	@IBAction func tapForCalculate(_ sender: UIButton) {
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}

