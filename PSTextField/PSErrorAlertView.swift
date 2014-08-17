//
//  PSErrorAlertView.swift
//  PSTextFieldDemo
//
//  Created by Pawan Kumar Singh on 15/08/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

import UIKit

class PSErrorAlertView: UIView {
    
    var popUpTriangleTipPoint: CGPoint = CGPointZero
    var popUpTriangleHorizontalRightMargin: CGFloat = 0.0
    weak var errorMsg: NSString!
    weak var popupView: PSErrorPopupView! = nil

    override init(frame : CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    convenience init(errorMessage: NSString)
    {
        var frame: CGRect = UIScreen.mainScreen().bounds
        self.init(frame: frame)
        errorMsg = errorMessage
        self.backgroundColor = UIColor.clearColor()
        var tapGestureRecogniser: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissErrorAlertView:")
        self.addGestureRecognizer(tapGestureRecogniser)

    }
    
    func displayAlert(){
        
        addPopupView()
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.window.addSubview(self)
    }
 
    
    func addPopupView(){
        
        var textSize: CGSize = self.errorMsg.sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(13.0)])
        textSize = CGSizeMake(ceil(textSize.width)+10.0, ceil(textSize.height));    //Added 5 pixel margin from both ends.
        textSize.width = (textSize.width < 140.0) ? 140.0 : textSize.width;
        textSize.height = (textSize.height < 30.0) ? 30.0 : textSize.height;
        
        var frame: CGRect = CGRectZero;
        
        frame.origin.x = popUpTriangleTipPoint.x + popUpTriangleHorizontalRightMargin - textSize.width;
        frame.origin.y = popUpTriangleTipPoint.y
        frame.size = textSize;
        
        var triangleMidX: CGFloat = frame.size.width - self.popUpTriangleHorizontalRightMargin;
        addSubview(PSErrorPopupView(frame: frame, errorMessage: errorMsg, triangleCenterX: triangleMidX))
        
    }
    
    func dismissErrorAlertView(gestureRecog: UITapGestureRecognizer) {
        
        removeFromSuperview()
    }
}