//
//  UIUtil.swift
//  PCSA
//  Utility class for UI related functions
//
//  Created by Chamika Weerasinghe on 6/8/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import Foundation

class UIUtil{
    
    class func initViewControllerViews(_ viewController :UIViewController ){
        viewController.navigationController!.navigationBar.barTintColor = UIColor.init(red: 48/255, green: 231/255, blue: 176/255, alpha: 1.0)
        viewController.navigationController!.navigationBar.tintColor = UIColor.white
        let textAttributes = [NSForegroundColorAttributeName:UIColor.white]
        viewController.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    class func showAlert(_ viewController: UIViewController,title:String, message:String, actions:[UIAlertAction]?) {
        
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        if(actions == nil || actions!.count == 0){
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        }else{
            for action in actions! {
                alert.addAction(action)
            }
        }
        
        // show the alert
        viewController.present(alert, animated: true, completion: nil)
    }
}
