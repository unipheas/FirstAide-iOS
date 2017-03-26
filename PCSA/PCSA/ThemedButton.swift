//
//  ThemedButton.swift
//  PCSA
//  Application's theme applied button. Use this class for each button for maintaining UI consistency. 
//
//  Created by Chamika Weerasinghe on 6/5/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import UIKit

class ThemedButton: SimpleButton {

    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBorderWidth(2.0, forState: UIControlState())
        setBorderWidth(4.0, forState: .highlighted)
        setCornerRadius(3.0)
        
        setBackgroundColor(UIColor(red: 150/255, green: 100/255, blue: 200/255, alpha: 1.0), forState: .highlighted)
        setBackgroundColor(UIColor(red: 47/255, green: 187/255, blue: 147/255, alpha: 1.0), forState: UIControlState())
        setBorderColor(UIColor.white)
        setScale(1.02, forState: .highlighted)
        
        setTitleColor(UIColor.white, for: UIControlState())
        setTitleColor(UIColor.white, for: .highlighted)
    }
}
