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
        locationPicker.isHidden = true
        
    }
    
    //MARK: Actions
    
    @IBAction func selectNext(_ sender: AnyObject) {
        otherStaffView.isHidden=false;
        postStaffView.isHidden=true;
    }
    @IBAction func selectPrevious(_ sender: AnyObject) {
        otherStaffView.isHidden=true;
        postStaffView.isHidden=false;
    }
    
    @IBAction func pcmoCall(_ sender: UIButton) {
        startCall(pcmoPhoneText.text!)
    }
    
    @IBAction func ssmCall(_ sender: AnyObject) {
        startCall(ssmPhoneText.text!)
    }
    
    @IBAction func sarlCall(_ sender: AnyObject) {
        startCall(sarlPhoneText.text!)
    }

    @IBAction func pcSavesUSCall(_ sender: AnyObject) {
        startCall(Constants.PC_SAVES_NON_US_PHONE_NUMBER)
    }

    
    @IBAction func officeVictimCall(_ sender: AnyObject) {
        startCall(Constants.OFFICE_VICTIM_PHONE_NUMBER)
    }
    
    @IBAction func officeInspectionCall(_ sender: AnyObject) {
        startCall(Constants.OFFICE_INSPECTION_PHONE_NUMBER)
    }
    
    @IBAction func officeCivilCall(_ sender: AnyObject) {
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationPicker.isHidden = true
        locationText.text = pickerDataSource[row]
        updatePhoneNumbers(row)
    }
    
    //MARK: Location text
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        locationPicker.isHidden = false
        return false
    }
    
    func updatePhoneNumbers(_ locationIndex: Int){
        pcmoPhoneText.text = Constants.PCMO_NUMBERS[locationIndex]
        ssmPhoneText.text = Constants.SSM_NUMBERS[locationIndex]
        sarlPhoneText.text = Constants.SARL_NUMBERS[locationIndex]
    }
    
    func startCall(_ phoneNumber: String){
        UIApplication.shared.openURL(URL(string: "telprompt://\(phoneNumber)")!)
    }

}
