//
//  MainViewController.swift
//  PCSA
//  Landing view controller after the splash or the login.
//  Provide funtionality to navigate to main components
//
//  Created by Chamika Weerasinghe on 5/29/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    // MARK: State
    override func viewDidLoad() {
        super.viewDidLoad()

        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        UIUtil.initViewControllerViews(self)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
