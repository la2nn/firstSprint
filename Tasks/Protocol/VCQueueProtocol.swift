//
//  VCQueueProtocol.swift
//  Tasks
//
//  Created by Vova SKR on 29/10/2019.
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
        guard let element = newElement.text, newElement.text != "" else { return }
        queue.addElement(value: element)
        newElement.text = nil
    }
    
    @IBAction func printElement(_ sender: UIButton) {
        guard let text = numberOfElement.text, let number = Int(text) else { elementByNumber.text = "Ошибка"; return }
        let element = queue[number]
        elementByNumber.text = String(element ?? "Такого элемента нет")
    }
    
    @IBAction func printCounfOfElements(_ sender: UIButton) {
        countOfElements.text = String(queue.size)
    }
    
    
}
