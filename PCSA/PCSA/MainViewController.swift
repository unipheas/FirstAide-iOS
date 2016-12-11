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
    @IBOutlet var menuButtons: [UIBarButtonItem]!
    @IBOutlet var forwardButtons: [UIBarButtonItem]!
    var cameBackFrom: UIViewController?
    
    // MARK: State
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if revealViewController() != nil {
            for button in menuButtons {
                button.target = revealViewController()
                button.action = #selector(SWRevealViewController.revealToggle(_:))
                view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            }
        }
        
        forwardButtons[0].isEnabled = false
        UIUtil.initViewControllerViews(self)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    

    
    // MARK: - Navigation
    @IBAction func goBack(segue:UIStoryboardSegue) {
        if segue.source is MainViewController {
            cameBackFrom = segue.source as! MainViewController
            forwardButtons[0].isEnabled = true
        }
    }
    
    @IBAction func goForth(_ sender: UIBarButtonItem) {
        if cameBackFrom != nil {
            self.navigationController?.pushViewController(cameBackFrom!, animated: true)
            cameBackFrom = nil
        }
    }
    
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}
