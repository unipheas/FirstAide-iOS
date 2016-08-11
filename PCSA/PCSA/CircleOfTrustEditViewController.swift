//
//  CircleOfTrustEditViewController.swift
//  PCSA
//
//  Created by Chamika Weerasinghe on 6/10/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import UIKit
import ContactsUI

class CircleOfTrustEditViewController: UIViewController, CNContactPickerDelegate,UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var textFieldNumber1: UITextField!
    @IBOutlet weak var textFieldNumber2: UITextField!
    @IBOutlet weak var textFieldNumber3: UITextField!
    @IBOutlet weak var textFieldNumber4: UITextField!
    @IBOutlet weak var textFieldNumber5: UITextField!
    @IBOutlet weak var textFieldNumber6: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var numbers = [String]()
    var textFields = [UITextField]()
    
    var selectedTextField:UITextField!
    var activeField:UITextField?
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("numbers")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIUtil.initViewControllerViews(self)
        textFields += [textFieldNumber1,textFieldNumber2,textFieldNumber3,textFieldNumber4,textFieldNumber5,textFieldNumber6]
        
        if let savedNumbers = loadNumbers() {
            numbers += savedNumbers
        }else{
            for _ in 0...5{
                numbers.append("")
            }
        }
        updateTextFields(numbers)
        
        //set textFields delegate
        for i in 0..<(textFields.count){
            textFields[i].delegate = self;
        }
        addDoneButtonOnKeyboard()
    }
    
    override func viewWillAppear(animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    //MARK: Actions
    @IBAction func selectContact1(sender: AnyObject) {
        self.selectContactPick(0)
    }
    
    @IBAction func selectContact2(sender: AnyObject) {
        self.selectContactPick(1)
    }
    
    @IBAction func selectContact3(sender: AnyObject) {
        self.selectContactPick(2)
    }
    
    
    @IBAction func selectContact4(sender: AnyObject) {
        self.selectContactPick(3)
    }
    
    @IBAction func selectContact5(sender: AnyObject) {
        self.selectContactPick(4)
    }
    
    @IBAction func selectContact6(sender: AnyObject) {
        self.selectContactPick(5)
    }
    
    func selectContactPick(index:Int){
        selectedTextField = textFields[index]
        let contactPicker = CNContactPickerViewController()
        contactPicker.displayedPropertyKeys = [CNContactPhoneNumbersKey]
        contactPicker.delegate = self
        navigationController?.presentViewController(contactPicker,
                                                    animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if(identifier == "exitSaveNumbers" ){
            return self.saveNumbers()
        }
        return true;
    }
    
    //MARK: Data
    func saveNumbers() -> Bool{
        for i in 0...5{
            numbers[i] = textFields[i].text!
        }
        
        let saveSuccess = NSKeyedArchiver.archiveRootObject(numbers, toFile: CircleOfTrustEditViewController.ArchiveURL.path!)
        if(saveSuccess){
            return true
        }else{
            UIUtil.showAlert(self, title: "Save", message: "Numbers failed to save", actions: nil)
            return false
        }
    }
    
    func loadNumbers() -> [String]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(CircleOfTrustEditViewController.ArchiveURL.path!) as? [String]
    }
    
    func updateTextFields(numbers:[String]){
        for i in 0..<(numbers.count){
            textFields[i].text = numbers[i]
        }
    }
    
    //MARK: Keyboard handling
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, self.view.bounds.size.width, 50))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: #selector(CircleOfTrustEditViewController.finishDecimalKeypad))
        
        var items: [UIBarButtonItem]? = [UIBarButtonItem]()
        items?.append(flexSpace)
        items?.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        for i in 0...5{
            textFields[i].inputAccessoryView=doneToolbar
        }
        
    }
    
    func finishDecimalKeypad() {
        for i in 0...5{
            textFields[i].resignFirstResponder()
        }
    }
    
    func registerForKeyboardNotifications()
    {
        //Adding notifies on keyboard appearing
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CircleOfTrustEditViewController.keyboardWasShown(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CircleOfTrustEditViewController.keyboardWillBeHidden(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    
    func deregisterFromKeyboardNotifications()
    {
        //Removing notifies on keyboard appearing
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification)
    {
        //Need to calculate keyboard exact size due to Apple suggestions
        self.scrollView.scrollEnabled = true
        let info : NSDictionary = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue().size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if (activeField != nil)
        {
            if (!CGRectContainsPoint(aRect, activeField!.frame.origin))
            {
                self.scrollView.scrollRectToVisible(activeField!.frame, animated: true)
            }
        }
        
        
    }
    
    
    func keyboardWillBeHidden(notification: NSNotification)
    {
        //Once keyboard disappears, restore original positions
        let info : NSDictionary = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue().size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -keyboardSize!.height, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.scrollView.scrollEnabled = false
        
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField)
    {
        activeField = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField)
    {
        activeField = nil
    }
    
    // MARK: Contacts Picker
    func contactPicker(picker: CNContactPickerViewController, didSelectContactProperty contactProperty: CNContactProperty) {
        let phoneNumber = contactProperty.value as! CNPhoneNumber
        selectedTextField.text = phoneNumber.stringValue
    }
    
}
