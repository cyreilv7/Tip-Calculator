//
//  ViewController.swift
//  tip-calculator
//
//  Created by Will on 8/14/22.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tipPercentages: [Double] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        
        let tip1 = defaults.string(forKey: "tip1") ?? "15"
        let tip2 = defaults.string(forKey: "tip2") ?? "18"
        let tip3 = defaults.string(forKey: "tip3") ?? "20"

        tipPercentages = [Double(tip1) ?? 15 , Double(tip2) ?? 18 , Double(tip3) ?? 20]
        
        tipControl.setTitle("\(tip1)%", forSegmentAt: 0)
        tipControl.setTitle("\(tip2)%", forSegmentAt: 1)
        tipControl.setTitle("\(tip3)%", forSegmentAt: 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex] / 100
        let total = tip + bill
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
    }
    

}
