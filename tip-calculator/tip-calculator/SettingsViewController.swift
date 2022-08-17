//
//  SettingsViewController.swift
//  tip-calculator
//
//  Created by Will on 8/15/22.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let defaults = UserDefaults.standard


    @IBOutlet weak var newTip1: UITextField!
    @IBOutlet weak var newTip2: UITextField!
    @IBOutlet weak var newTip3: UITextField!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currencyLabel: UITextField!
    
    var currencies: [String] = [];
    
    // save to defaults upon clicking save button
    override func prepare(for segue: UIStoryboardSegue!, sender: (Any)?) {
        if segue.identifier == "showTipViewSegue" {
            defaults.set(newTip1.text, forKey: "tip1")
            defaults.set(newTip2.text, forKey: "tip2")
            defaults.set(newTip3.text, forKey: "tip3")
            
            defaults.synchronize()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        newTip1.text = defaults.string(forKey: "tip1")
        newTip2.text = defaults.string(forKey: "tip2")
        newTip3.text = defaults.string(forKey: "tip3")
        
        let selectedCurrency = defaults.string(forKey: "selectedCurrency") ?? Locale.current.currencyCode
        
        currencies = Locale.isoCurrencyCodes
        
        self.currencyLabel.delegate = self
        self.currencyPicker.delegate = self
        self.currencyPicker.dataSource = self
        
        let currencyIndex = currencies.firstIndex(of: selectedCurrency!)
        currencyPicker.selectRow(currencyIndex!, inComponent: 0, animated: false)
        
        currencyPicker.isHidden = true
        currencyLabel.text = selectedCurrency
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        newTip1.keyboardType = .numberPad
    }
    
    // number of picker columns
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // number of picker rows
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count // Number of rows = the amount in currency array
    }

    // row title

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return currencies[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.currencyPicker.isHidden = true
        self.currencyLabel.isHidden = false
        self.currencyLabel.text = currencies[row]
        
        defaults.set(currencies[row], forKey: "selectedCurrency")
        defaults.synchronize()
    }
    
    // hide label when clicked and display picker
    func textFieldShouldBeginEditing(_ textfield: UITextField) -> Bool {
        switch textfield {
        case currencyLabel:
            self.currencyLabel.isHidden = true
            self.currencyPicker.isHidden = false
            return false
        default:
            return true
        }
    }
    
}
