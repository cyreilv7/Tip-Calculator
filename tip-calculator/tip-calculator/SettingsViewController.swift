//
//  SettingsViewController.swift
//  tip-calculator
//
//  Created by Will on 8/15/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var newTip1: UITextField!
    
    @IBOutlet weak var newTip2: UITextField!
    
    @IBOutlet weak var newTip3: UITextField!
    
    
    @IBAction func updateTips(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(newTip1.text, forKey: "tip1")
        defaults.set(newTip2.text, forKey: "tip2")
        defaults.set(newTip3.text, forKey: "tip3")
        
        defaults.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
