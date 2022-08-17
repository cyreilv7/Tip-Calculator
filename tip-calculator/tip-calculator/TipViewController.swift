//
//  ViewController.swift
//  tip-calculator
//
//  Created by Will on 8/14/22.
//

import UIKit

class TipViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var numPeopleControl: UIStepper!
    @IBOutlet weak var personPluralityLabel: UILabel!
    @IBOutlet weak var numPeopleLabel: UILabel!
    
    var tipPercentages: [Double] = []
    
    override func viewWillAppear(_ animated: Bool) {
        numPeopleControl.minimumValue = 1
        
        super.viewWillAppear(animated)
        
        let tip1 = defaults.string(forKey: "tip1") ?? "15"
        let tip2 = defaults.string(forKey: "tip2") ?? "18"
        let tip3 = defaults.string(forKey: "tip3") ?? "20"
                
        tipPercentages = [Double(tip1) ?? 15 , Double(tip2) ?? 18 , Double(tip3) ?? 20]
        
        tipControl.setTitle("\(tip1)%", forSegmentAt: 0)
        tipControl.setTitle("\(tip2)%", forSegmentAt: 1)
        tipControl.setTitle("\(tip3)%", forSegmentAt: 2)
        
        tipAmountLabel.text = convertToCurrencyString(0)
        totalLabel.text = convertToCurrencyString(0)
        
        // check if 10 minutes have elapsed since last bill entered
        let currentTime = Int(Date().timeIntervalSince1970);
        let timeLastBillWasEntered = defaults.integer(forKey: "timeLastBillWasEntered") ?? 0
        if currentTime - timeLastBillWasEntered < 600 {
            billAmountTextField.text = defaults.string(forKey: "lastBillEntered")
            
            let bill = Double(billAmountTextField.text!) ?? 0
            
            let numPeople = numPeopleControl.value

            let tip = bill * tipPercentages[tipControl.selectedSegmentIndex] / 100
            let total = (tip + bill) / numPeople
            
            tipAmountLabel.text = convertToCurrencyString(tip)
            totalLabel.text = convertToCurrencyString(total)
            
        }
        else {
            billAmountTextField.text = "0.00"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tip Calculator"
        
        billAmountTextField.becomeFirstResponder()
        
        billAmountTextField.keyboardType = .numberPad
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0

        let currentTime = Int(Date().timeIntervalSince1970);
        
        defaults.set(currentTime, forKey: "timeLastBillWasEntered")
        defaults.set(bill, forKey: "lastBillEntered")
        defaults.synchronize()
        
        let numPeople = numPeopleControl.value
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex] / 100
        let total = (tip + bill) / numPeople
        
        tipAmountLabel.text = convertToCurrencyString(tip)
        totalLabel.text = convertToCurrencyString(total)
    }
    
    @IBAction func showNumPeople(_ sender: Any) {
        let numPeople = numPeopleControl.value
        numPeopleLabel.text = String(Int(numPeopleControl.value))
        if numPeople == 1 {
            personPluralityLabel.text = "person"
        } else {
            personPluralityLabel.text = "people"
        }
    }
                     
    func convertToCurrencyString(_ amount: Double) -> String {
        let formatter = NumberFormatter();
        formatter.numberStyle = .currency
        formatter.currencyCode = defaults.string(forKey: "selectedCurrency") ?? "USD"
        return formatter.string(from: amount as NSNumber)!
    }
                     
}
