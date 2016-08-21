//
//  SupportServiceViewController.swift
//  PCSA
//
//  Created by Chamika Weerasinghe on 6/26/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import UIKit

class SupportServiceViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var firstButtonTrailing: NSLayoutConstraint!
    
    //MARK: ViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        firstButtonTrailing.constant = (self.scrollView.frame.width - firstButton.frame.width) / (2 * UIScreen.mainScreen().scale)
        
    }    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
