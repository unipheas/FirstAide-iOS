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
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let logged = defaults.boolForKey(Configs.KEY_LOGGED)
        
        if(logged){
            performSelector(#selector(SplashViewController.showMainController), withObject: nil, afterDelay: 0)
        }else{
            performSelector(#selector(SplashViewController.showLoginController), withObject: nil, afterDelay: 0)
        }
    }
    
    func showMainController(){
        performSegueWithIdentifier("MainNav", sender: self)
    }
    
    func showLoginController(){
        performSegueWithIdentifier("LoginNav", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

