//
//  Design.swift
//  EmergencyCall
//
//  Created by Ubaid Javaid on 30/04/2018.
//  Copyright © 2018 Ubaid Javaid. All rights reserved.
//

import UIKit

@IBDesignable class LabelDesign: UILabel {
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.drawText(in: rect)
        let line = UIBezierPath(rect: CGRect(x : 0, y: self.frame.size.height-self.lineWidth, width:self.frame.size.width, height: self.lineWidth))
        self.lineColor.setFill()
        line.fill()
    }
    @IBInspectable var lineColor:UIColor = .red {
        didSet{
            self.setNeedsDisplay()
        }
        
    }
    
    @IBInspectable  var lineWidth: CGFloat = 1 {
        didSet{
            self.setNeedsDisplay()
        }
    }
    
}



