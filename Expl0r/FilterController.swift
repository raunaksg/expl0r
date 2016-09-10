//
//  FilterController.swift
//  Expl0r
//
//  Created by Linda Xia on 9/9/16.
//  Copyright © 2016 CMU. All rights reserved.
//

import UIKit

class FilterController: UIViewController {

    @IBOutlet var timeTextField: UITextField!
    @IBOutlet var timeDropDown: UIPickerView!

    var timeList = ["Full day", "Half day", "Surprise me!"]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return timeList.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        self.view.endEditing(true)
        return timeList[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.timeTextField.text = self.timeList[row]
        self.timeDropDown.hidden = true
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField)
    {
        if textField == self.timeTextField {
            self.timeDropDown.hidden = true
            timeTextField.endEditing(true)
        }
    }





}






