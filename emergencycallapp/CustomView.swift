//
//  CustomView.swift
//  
//
//  Created by Hasan on 6/19/18.
//

import UIKit

@IBDesignable class CustomView: UIView {

    override func draw(_ rect: CGRect) {
        // Drawing code
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor?.cgColor
    }

@IBInspectable var borderColor: UIColor? = UIColor.red {
    didSet {
        layer.borderColor = self.borderColor?.cgColor
    }
}
@IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
        layer.borderWidth = self.borderWidth
    }
}
@IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
        layer.cornerRadius = self.cornerRadius
        layer.masksToBounds = self.cornerRadius > 0
    }
}
}
