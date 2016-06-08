//
//  UIUtil.swift
//  PCSA
//
//  Created by Chamika Weerasinghe on 6/8/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import Foundation

class UIUtil{
    
    class func initViewControllerViews(viewController :UIViewController ){
        viewController.navigationController!.navigationBar.barTintColor = UIColor.init(red: 48/255, green: 231/255, blue: 176/255, alpha: 1.0)
        viewController.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let textAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        viewController.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
}