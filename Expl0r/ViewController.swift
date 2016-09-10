//
//  ViewController.swift
//  Expl0r
//
//  Created by Raunak Gupta on 9/9/16.
//  Copyright © 2016 CMU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var textField: UITextField!
    
    
    
    @IBAction func AddButton(sender: UIButton) {
        
        let newItem = textField.text
        textField.keyboardType = UIKeyboardType.Default
        textField.resignFirstResponder()
        
        print(newItem)
        
    }
    
}

