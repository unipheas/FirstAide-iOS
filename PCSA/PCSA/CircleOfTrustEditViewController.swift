//
//  CircleOfTrustEditViewController.swift
//  PCSA
//
//  Created by Chamika Weerasinghe on 6/10/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import UIKit

class CircleOfTrustEditViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var textFieldNumber1: UITextField!
    @IBOutlet weak var textFieldNumber2: UITextField!
    @IBOutlet weak var textFieldNumber3: UITextField!
    @IBOutlet weak var textFieldNumber4: UITextField!
    @IBOutlet weak var textFieldNumber5: UITextField!
    @IBOutlet weak var textFieldNumber6: UITextField!
    
    var numbers = [String]()
    var textFields = [UITextField]()
    
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
        addDoneButtonOnKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    @IBAction func saveNumbers(sender: UIButton) {
        self.saveNumbers()
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "exitSaveNumbers" ){
            self.saveNumbers()
        }
    }
    
    
    //MARK: Data
    func saveNumbers(){
        for i in 0...5{
            numbers[i] = textFields[i].text!
        }
        
       let saveSuccess = NSKeyedArchiver.archiveRootObject(numbers, toFile: CircleOfTrustEditViewController.ArchiveURL.path!)
        if(saveSuccess){
            print("Numbers saved sucessfully")
        }else{
            print("Number failed to save")
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

}
