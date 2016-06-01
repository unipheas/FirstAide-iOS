//
//  ViewController.swift
//  PCSA
//
//  Created by Chamika Weerasinghe on 5/29/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSelector(#selector(SplashViewController.showMainController), withObject: nil, afterDelay: 2)
    }
    
    func showMainController(){
        performSegueWithIdentifier("MainNav", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

