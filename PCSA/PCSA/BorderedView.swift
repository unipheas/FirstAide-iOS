//
//  BorderedView.swift
//  PCSA
//  UIView having with colored border 
//
//  Created by Chamika Weerasinghe on 6/26/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import UIKit

@IBDesignable class BorderedView: UIView {

    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
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
