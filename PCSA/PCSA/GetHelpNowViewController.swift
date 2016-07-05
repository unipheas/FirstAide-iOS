//
//  GetHelpNowViewController.swift
//  PCSA
//
//  Created by Chamika Weerasinghe on 6/27/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import UIKit

class GetHelpNowViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var postStaffView: UIView!
    @IBOutlet weak var otherStaffView: UIView!
    
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var locationPicker: UIPickerView!
    
    @IBOutlet weak var pcmoCallButton: UIButton!
    @IBOutlet weak var pcmoPhoneText: UILabel!
    
    @IBOutlet weak var ssmCallButton: UIButton!
    @IBOutlet weak var ssmPhoneText: UILabel!
    
    @IBOutlet weak var sarlCallButton: UIButton!
    @IBOutlet weak var sarlPhoneText: UILabel!
    
    var pickerDataSource = Constants.CONTACT_LOCATIONS;
    
    
    //MARK: ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationPicker.dataSource = self
        self.locationPicker.delegate = self
        self.locationText.delegate = self
        locationText.text=pickerDataSource[0]
        updatePhoneNumbers(0)
        locationPicker.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    @IBAction func selectNext(sender: AnyObject) {
        otherStaffView.hidden=false;
        postStaffView.hidden=true;
    }
    @IBAction func selectPrevious(sender: AnyObject) {
        otherStaffView.hidden=true;
        postStaffView.hidden=false;
    }
    
    @IBAction func pcmoCall(sender: UIButton) {
        startCall(pcmoPhoneText.text!)
    }
    
    @IBAction func ssmCall(sender: AnyObject) {
        startCall(ssmPhoneText.text!)
    }
    
    @IBAction func sarlCall(sender: AnyObject) {
        startCall(sarlPhoneText.text!)
    }

    @IBAction func pcSavesUSCall(sender: AnyObject) {
        startCall(Constants.PC_SAVES_NON_US_PHONE_NUMBER)
    }

    
    @IBAction func officeVictimCall(sender: AnyObject) {
        startCall(Constants.OFFICE_VICTIM_PHONE_NUMBER)
    }
    
    @IBAction func officeInspectionCall(sender: AnyObject) {
        startCall(Constants.OFFICE_INSPECTION_PHONE_NUMBER)
    }
    
    @IBAction func officeCivilCall(sender: AnyObject) {
        startCall(Constants.OFFICE_CIVIL_PHONE_NUMBER)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Location picker
    
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
        locationPicker.hidden = true
        locationText.text = pickerDataSource[row]
        updatePhoneNumbers(row)
    }
    
    //MARK: Location text
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        locationPicker.hidden = false
        return false
    }
    
    func updatePhoneNumbers(locationIndex: Int){
        pcmoPhoneText.text = Constants.PCMO_NUMBERS[locationIndex]
        ssmPhoneText.text = Constants.SSM_NUMBERS[locationIndex]
        sarlPhoneText.text = Constants.SARL_NUMBERS[locationIndex]
    }
    
    func startCall(phoneNumber: String){
        UIApplication.sharedApplication().openURL(NSURL(string: "telprompt://\(phoneNumber)")!)
    }

}
