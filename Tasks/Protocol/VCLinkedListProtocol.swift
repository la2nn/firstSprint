//
//  VCLinkenListProtocol.swift
//  Tasks
//
//  Created by Vova SKR on 28/10/2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import UIKit

class VCLinkedListProtocol: UIViewController {
    
    @IBOutlet weak var newElement: UITextField!
    @IBOutlet weak var numberOfElement: UITextField!
    @IBOutlet weak var elementByNumber: UILabel!
    
    @IBOutlet weak var countOfElement: UILabel!
    var list = LinkedListProtocol<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func addElement(_ sender: UIButton) {
        guard let element = newElement.text else { return }
        list.addElement(value: element)
        newElement.text = nil
    }
    
    @IBAction func printElement(_ sender: UIButton) {
        guard let text = numberOfElement.text, let number = (Int(text) ?? nil) else { return }
        let element = list[number]
        elementByNumber.text = String(element ?? "")
    }
    @IBAction func printCount(_ sender: UIButton) {
        countOfElement.text = String(list.size)
    }
    
}


