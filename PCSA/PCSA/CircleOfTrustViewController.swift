//
//  CircleOfTrustViewController.swift
//  PCSA
//
//  Created by Chamika Weerasinghe on 6/8/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import UIKit

class CircleOfTrustViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var buttonHelpMe: UIButton!
    @IBOutlet weak var buttonTrustee1: UIButton!
    @IBOutlet weak var buttonTrustee2: UIButton!
    @IBOutlet weak var buttonTrustee3: UIButton!
    @IBOutlet weak var buttonTrustee4: UIButton!
    @IBOutlet weak var buttonTrustee5: UIButton!
    @IBOutlet weak var buttonTrustee6: UIButton!
    @IBOutlet weak var constraintNorthHeight: NSLayoutConstraint!
    @IBOutlet weak var constraintSouthHeight: NSLayoutConstraint!
    
    
    //MARK: ViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        UIUtil.initViewControllerViews(self)
        
        //reposition buttons 1,2,5,6 (buttons which are not in center Y)
        let radius = buttonTrustee4.frame.origin.x - buttonHelpMe.frame.origin.x
        let height = radius * sin(NumberUtil.degToRad(60))/UIScreen.mainScreen().scale
        
        constraintNorthHeight.constant = height
        constraintSouthHeight.constant = height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
