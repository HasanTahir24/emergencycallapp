//
//  TextFieldDesign2.swift
//  emergencycallapp
//
//  Created by Hasan on 6/13/18.
//  Copyright © 2018 Axiom HK 13. All rights reserved.
//

import UIKit
@IBDesignable
class TextFieldDesign2: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
     
    */
    @IBInspectable var borderColor:UIColor = .red {
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat  = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
