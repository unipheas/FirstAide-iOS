//
//  BorderedView.swift
//  PCSA
//
//  Created by Chamika Weerasinghe on 6/26/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import UIKit

@IBDesignable class BorderedView: UIView {

    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

}
