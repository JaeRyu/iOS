//
//  PushButtonView.swift
//  Flo
//
//  Created by kpugame on 2017. 5. 31..
//  Copyright © 2017년 Jae Won Yoo. All rights reserved.
//

import UIKit
@IBDesignable
class PushButtonView: UIButton {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    
    override func draw(_ rect: CGRect) {
        var path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let plusHeight: CGFloat = 3.0
        let pluswidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        var plusPath = UIBezierPath()
        
        plusPath.lineWidth = plusHeight
        
        
        //수평
        plusPath.move(to: CGPoint(x: bounds.width/2 - pluswidth/2 + 0.5, y: bounds.height/2 + 0.5))
        
        plusPath.addLine(to: CGPoint(x: bounds.width/2 + pluswidth/2 + 0.5, y: bounds.height/2 + 0.5))
        if isAddButton {
            //수직
            plusPath.move(to: CGPoint(x: bounds.width/2  + 0.5, y: bounds.height/2 - pluswidth/2 + 0.5))
            
            plusPath.addLine(to: CGPoint(x: bounds.width/2 + 0.5, y: bounds.height/2 + pluswidth/2 + 0.5))
        }
        
        
        UIColor.white.setStroke()
        
        plusPath.stroke()
    }
    

}
