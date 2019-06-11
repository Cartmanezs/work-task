//
//  NumbersAndLetters.swift
//  work task
//
//  Created by Ingvar on 6/8/19.
//  Copyright © 2019 Igor. All rights reserved.
//

import UIKit

class NumbersAndLettersViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var numberPickerView: UIPickerView!
    @IBOutlet weak var lettersPickerView: UIPickerView!
    
    var pickerNumbers: [Int] = []
    var pickerLetters:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerNumbers = Array(1...100)
        pickerLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        
        self.numberPickerView.delegate = self
        self.numberPickerView.dataSource = self
        
        self.lettersPickerView.delegate = self
        self.lettersPickerView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            return pickerNumbers.count
        } else {
            return pickerLetters.count
        }
        
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return "\(pickerNumbers[row])"
        } else {
            return "\(pickerLetters[row])"
        }
    }
}

