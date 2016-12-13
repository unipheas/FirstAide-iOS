//
//  ScrollableTextView.swift
//  PCSA
//
//  Created by Yash Bharti on 13/12/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import Foundation

import UIKit



class ScrollableTextView: UITextView {
    
    
    
    /*
     
     // Only override draw() if you perform custom drawing.
     
     // An empty implementation adversely affects performance during animation.
     
     override func draw(_ rect: CGRect) {
     
     // Drawing code
     
     }
     
     */
    
    
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
        
        DispatchQueue.main.async {
            
            self.setContentOffset(CGPoint.zero, animated: false)
            
        }

}
}
