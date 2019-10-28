//
//  ProtocolViewController.swift
//  Tasks
//
//  Created by Дарья Витер on 25/10/2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import UIKit

class VCQueueProtocol: UIViewController {
    
    @IBOutlet weak var newElement: UITextField!
    @IBOutlet weak var numberOfElement: UITextField!
    @IBOutlet weak var elementByNumber: UILabel!
    @IBOutlet weak var countOfElements: UILabel!
    
    var queue = Queue<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func addElement(_ sender: UIButton) {
        guard let element = newElement.text else { return }
        queue.addElement(element: element)
        newElement.text = nil
    }
    
    @IBAction func printElement(_ sender: UIButton) {
        guard let text = numberOfElement.text, let number = (Int(text) ?? nil) else { return }
               let element = queue.atIndex(index: number)
               elementByNumber.text = String(element ?? "")
    }
    
    @IBAction func printCounfOfElements(_ sender: UIButton) {
        countOfElements.text = String(queue.size)
    }
    
    
}
