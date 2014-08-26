//
//  PSErrorPopupView.swift
//  PSTextFieldDemo
//
//  Created by Pawan Kumar Singh on 15/08/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

import UIKit

let TRIANGLE_BASE_WIDTH: CGFloat = 16.0
let TRIANGLE_HEIGHT: CGFloat = 10.0
let RECTANGLE_HEIGHT: CGFloat = 3.0

class PSErrorPopupView: UIView {

    var errorMsg: String!
    var popUpPointX: CGFloat!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame aRect: CGRect, errorMessage aMessage: String, triangleCenterX x: CGFloat)
    {
        var tempFrame: CGRect = aRect
        tempFrame.size.height += 13.0
        self.init(frame: tempFrame)
        
        // Initialization code
        self.backgroundColor = UIColor.clearColor()
        self.errorMsg = aMessage
        self.popUpPointX = x
        
    }
  
    override func drawRect(rect :CGRect){
        
        // Drawing code
        var context: CGContextRef = UIGraphicsGetCurrentContext();
        CGContextBeginPath(context);
        
        //top triangle
        CGContextMoveToPoint(context, popUpPointX, 0.0);
        CGContextAddLineToPoint(context, popUpPointX-TRIANGLE_BASE_WIDTH/2, TRIANGLE_HEIGHT);
        CGContextAddLineToPoint(context, popUpPointX+TRIANGLE_BASE_WIDTH/2, TRIANGLE_HEIGHT);
        CGContextAddLineToPoint(context, popUpPointX, 0.0);
        
        CGContextAddRect(context, CGRectMake(0.0, TRIANGLE_HEIGHT, self.frame.size.width, RECTANGLE_HEIGHT));
        
        CGContextClosePath(context);
        CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);          //Red color
        CGContextDrawPath(context, kCGPathFill);
        
        var frame: CGRect = CGRectMake(0.0, TRIANGLE_HEIGHT+RECTANGLE_HEIGHT, self.frame.size.width, self.frame.size.height);
        
        var errorLabel: UILabel = UILabel(frame: frame)
        errorLabel.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.65)
        errorLabel.textAlignment = .Center
        errorLabel.textColor = UIColor.whiteColor()
        errorLabel.font = UIFont.systemFontOfSize(13.0)
        errorLabel.text = errorMsg
        addSubview(errorLabel)
        
    }
}
