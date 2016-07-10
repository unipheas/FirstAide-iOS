//
//  SlideView.swift
//  PCSA
//
//  Created by Chamika Weerasinghe on 7/10/16.
//  Copyright © 2016 Peacecorps. All rights reserved.
//

import UIKit

class SlideView: UIView {
    
    var top:CGFloat = 0
    var bottom:CGFloat = 0
    var popTopConstraint: NSLayoutConstraint?;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    func initSubviews(){
        // init two views and the sizes
        if let bottomView = self.viewWithTag(1) , popView = self.viewWithTag(2) {
            let bottomTapRecognizer = UITapGestureRecognizer()
            bottomTapRecognizer.addTarget(self, action: #selector(SlideView.showPopView))
            bottomView.addGestureRecognizer(bottomTapRecognizer)
            
            let popTapRecognizer = UITapGestureRecognizer()
            popTapRecognizer.addTarget(self, action: #selector(SlideView.hidePopView))
            popView.addGestureRecognizer(popTapRecognizer)
        }
        
        //init top constraint of pop view for changing when tapped
        for constraint in self.constraints where (constraint.identifier == "popTop") {
            popTopConstraint = constraint
            bottom = popTopConstraint!.constant
            break
        }
    }
    
    func showPopView(){
        
        if let bottomView = self.viewWithTag(1) {
            top = bottomView.frame.height
        }
        
        popTopConstraint?.constant = -top
        animateLayoutChange()
    }
    
    func hidePopView(){
        popTopConstraint?.constant = bottom
        animateLayoutChange()    }
    
    func animateLayoutChange(){
        UIView.animateWithDuration(0.5) {
            self.layoutIfNeeded()
        }
    }
    
}
