//
//  NumberUtil.swift
//  PCSA
//  Utility class for numeric, math and other calculations
//
//  Created by Chamika Weerasinghe on 6/9/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import Foundation
import Darwin

class NumberUtil {
    
    // converts degrees to radian
    class func degToRad(degrees: CGFloat) -> CGFloat {
        return CGFloat(M_PI * 2.0) * degrees / 360.0
    }
}