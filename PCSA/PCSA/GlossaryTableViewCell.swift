//
//  GlossaryTableViewCell.swift
//  PCSA
//
//  Created by Jacqueline Bronger on 12/01/17.
//  Copyright © 2017 Peacecorps. All rights reserved.
//

import UIKit

class GlossaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var entryTitle: UITextView!
    @IBOutlet weak var entryExplanation: UITextView!
    @IBOutlet weak var borderedExplanation: BorderedView!
    @IBOutlet weak var arrow: UIImageView!
    
    
    static let collapsedHeight: CGFloat = 55;
    static let approxExpandedHeight: CGFloat = 150;
    
    func checkExpanded() {
        borderedExplanation.isHidden = (frame.size.height == GlossaryTableViewCell.collapsedHeight)
        if borderedExplanation.isHidden {
            arrow.transform = CGAffineTransform(rotationAngle: 0)
        } else {
            arrow.transform = CGAffineTransform(rotationAngle: 1.6)
        }
    }
}
