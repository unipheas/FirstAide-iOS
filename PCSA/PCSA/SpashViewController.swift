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
        let defaults = UserDefaults.standard
        let logged = defaults.bool(forKey: Configs.KEY_LOGGED)
        
        if(logged){
            perform(#selector(SplashViewController.showMainController), with: nil, afterDelay: 0)
        }
        else{
            perform(#selector(SplashViewController.showLoginController), with: nil, afterDelay: 0)
        }
    }
    
    func showMainController(){
        performSegue(withIdentifier: "MainNav", sender: self)
    }
    
    func showLoginController(){
        performSegue(withIdentifier: "LoginNav", sender: self)
    }
}

