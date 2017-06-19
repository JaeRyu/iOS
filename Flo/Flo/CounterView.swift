//
//  CounterView.swift
//  Flo
//
//  Created by kpugame on 2017. 5. 31..
//  Copyright © 2017년 Jae Won Yoo. All rights reserved.
//

import UIKit

let NoOfGlasses = 8
let Pi:CGFloat = CGFloat(M_PI)
@IBDesignable
class CounterView: UIView {

    
    @IBInspectable var counter: Int = 5{
        didSet{
            if counter <= NoOfGlasses{
                setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor : UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.orange
        // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width/2 , y: bounds.height/2)
        
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        let arcWidth: CGFloat = 76
        
        let startAngle: CGFloat = 3 * Pi / 4
        let endAngle: CGFloat = Pi / 4
        
        var path = UIBezierPath(arcCenter: center, radius: radius/2 - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        let angleDifference: CGFloat = 2 * Pi - startAngle + endAngle
        
        let arcLengthPerGlass  = angleDifference / CGFloat(NoOfGlasses)
        
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        var outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2 - 2.5, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        
        outlinePath.addArc(withCenter: center, radius: bounds.width/2 - arcWidth + 2.5, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        
        outlinePath.close()
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
    }
    

}
