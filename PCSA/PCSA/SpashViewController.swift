//
//  ViewController.swift
//  PCSA
//  Showing splash at the beginning of the applicatin launch
//
//  Created by Chamika Weerasinghe on 5/29/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check whether the user already logged or not. If logged user will be directly navigated to Main Screen.
        // If not Login will be shown.
        let defaults = NSUserDefaults.standardUserDefaults()
        let logged = defaults.boolForKey(Configs.KEY_LOGGED)
        
        if(logged){
            performSelector(#selector(SplashViewController.showMainController), withObject: nil, afterDelay: 0)
        }
        else{
            performSelector(#selector(SplashViewController.showLoginController), withObject: nil, afterDelay: 0)
        }
    }
    
    func showMainController(){
        performSegueWithIdentifier("MainNav", sender: self)
    }
    
    func showLoginController(){
        performSegueWithIdentifier("LoginNav", sender: self)
    }
}

