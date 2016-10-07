//
//  LoginViewController.swift
//  PCSA
//
//  Created by Chamika Weerasinghe on 8/7/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate  {
    
    var pickerDataSource = Constants.CONTACT_LOCATIONS;
    var locationName = Constants.CONTACT_LOCATIONS[0]
    
    // MARK: Properties
    
    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var userNameText: UITextField!
    
    @IBAction func loginButtonTap(sender: AnyObject) {
        
        let username = userNameText.text
        
        if username!.isEmpty {
            UIUtil.showAlert(self, title: "Name", message: "User name is not valid", actions: nil)
            return
        }
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(username, forKeyPath: Configs.KEY_LOGGED)
        defaults.setValue(locationName, forKey: Configs.KEY_LOCATION)
        defaults.setBool(true, forKey: Configs.KEY_LOGGED)
        
        performSegueWithIdentifier("LoggedInNav", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationPicker.dataSource = self
        self.locationPicker.delegate = self
        self.userNameText.delegate = self
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    // Location Picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationName = pickerDataSource[row]
    }
    
    // UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
