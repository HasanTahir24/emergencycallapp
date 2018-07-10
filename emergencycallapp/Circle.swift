//
//  Circle.swift
//  emergencycallapp
//
//  Created by Axiom HK 13 on 02/05/2018.
//  Copyright © 2018 Axiom HK 13. All rights reserved.
//

import UIKit

@IBDesignable class Circle: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
   
        @IBInspectable var mainColor: UIColor = UIColor.clear
            {
            didSet { //print("mainColor was set here")
                
            }
        }
        @IBInspectable var ringColor: UIColor = UIColor.clear
            {
            didSet { //print("bColor was set here")
                
            }
        }
        @IBInspectable var ringThickness: CGFloat = 4
            {
            didSet { //print("ringThickness was set here")
                
            }
        }
        
        
        @IBInspectable var isSelected: Bool = true
        
        override func draw(_ rect: CGRect)
        {
            
            let dotPath = UIBezierPath(ovalIn: rect)
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = dotPath.cgPath
            shapeLayer.fillColor = mainColor.cgColor
            layer.addSublayer(shapeLayer)
            
            if (isSelected) { drawRingFittingInsideView(rect: rect) }
        }
        
        internal func drawRingFittingInsideView(rect: CGRect)->()
        {
            let hw:CGFloat = ringThickness/2
            let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: hw,dy: hw) )
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = circlePath.cgPath
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.strokeColor = ringColor.cgColor
            shapeLayer.lineWidth = ringThickness
            layer.addSublayer(shapeLayer)
        }
    }

    
    
