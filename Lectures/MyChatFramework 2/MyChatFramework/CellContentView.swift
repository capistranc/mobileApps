//
//  CellContentView.swift
//  MyChatFramework
//
//  Created by Mac on 9/28/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
@objc
internal enum MessageSender:Int {
    case user = 0
    case recipient = 1
}

@IBDesignable
public class CellContentView: UIView {
    @IBInspectable var bubbleType:MessageSender = .user
    
    @IBInspectable var HeightOfTriangle:CGFloat = 20.0 {
        didSet{
            guard HeightOfTriangle > 10.0 else {
                HeightOfTriangle = 10.0
                return
            }
        }
    }
    
    @IBInspectable var WidthOfTriangle:CGFloat = 20.0
    @IBInspectable var BorderRadius:CGFloat = 8.0
    @IBInspectable var StrokeWidth:CGFloat = 3.0
    
    @IBInspectable var strokeColor:UIColor = .blue
    @IBInspectable var fillColor:UIColor = .green
    
// Only override draw() if you perform custom drawing.
//  An empty implementation adversely affects performance during animation.
    override public func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0.0, y: self.bounds.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        let currentFrame = self.bounds
        
        context?.setLineJoin(.round)
        context?.setLineWidth(StrokeWidth)
        context?.setStrokeColor(strokeColor.cgColor)
        context?.setFillColor(fillColor.cgColor)
        
        context?.beginPath()
        
        //Draw a Triangle
        context?.move(to: CGPoint(x: BorderRadius + StrokeWidth + 0.5,
                                  y: StrokeWidth + HeightOfTriangle + 0.5))
        
//        let a1 = round(currentFrame.size.width*0.5 - WidthOfTriangle) + 0.5
//        let b1 = HeightOfTriangle + StrokeWidth + 0.5
//        let a2 = round(currentFrame.size.width*0.5) + 0.5
//        let b2 = StrokeWidth + 0.5
//
//
//        context?.addLine(to: CGPoint(x: a1, y: b1 ))
//        context?.addLine(to: CGPoint(x: a2, y: b2))
//        context?.addLine(to: CGPoint(x: a2, y: b2))
        
        
        let x1 = currentFrame.size.width - StrokeWidth - 0.5
        let y1 = StrokeWidth + HeightOfTriangle + 0.5

        let x2 = StrokeWidth + 0.5
        let y2 = currentFrame.size.height - StrokeWidth - 0.5
        
        context?.addArc(tangent1End: CGPoint(x:x1, y: y1),
                        tangent2End: CGPoint(x:x1, y: y2),
                        radius: BorderRadius - StrokeWidth)

        context?.addArc(tangent1End: CGPoint(x: x1, y: y2),
                        tangent2End: CGPoint(x: x2, y: y2),
                        radius: BorderRadius - StrokeWidth)

        context?.addArc(tangent1End: CGPoint(x: x2,y: y2),
                        tangent2End: CGPoint(x: x2,y: y1),
                        radius: BorderRadius - StrokeWidth)

        context?.addArc(tangent1End: CGPoint(x: x2,y: y1),
                        tangent2End: CGPoint(x: x1,y: y1),
                        radius: BorderRadius - StrokeWidth)
        
        context?.closePath()
        context?.drawPath(using: .fillStroke)
    }
}
