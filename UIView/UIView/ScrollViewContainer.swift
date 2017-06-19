//
//  ScrollViewContainer.swift
//  UIView
//
//  Created by kpugame on 2017. 4. 18..
//  Copyright © 2017년 Jae Won Yoo. All rights reserved.
//

import UIKit

class ScrollViewContainer: UIView {
    @IBOutlet var scrollView: UIScrollView!
    
    override func hitTest(_ point: CGPoint, with event: UIEvent!) -> UIView? {
        let view = super.hitTest(point, with: event)
        
        if let theView = view{
            if theView == self{
                return scrollView
            }
        }
        
        return view
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
