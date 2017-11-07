//
//  PointerView.swift
//  geradores-ios
//
//  Created by Rafagan Abreu on 24/10/17.
//  Copyright © 2017 Guizion Labs. All rights reserved.
//

import Foundation
import UIKit

func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

@IBDesignable open class PointerView : UIView {
    
    private enum BezierStates {
        case move
        case curve
        case line
    }
    
    override open func draw(_ rect: CGRect) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        let size = CGSize(width: 94, height: 10)
        let scaleX = rect.width / size.width
        let scaleY = rect.height / size.height
        let offsetFromOrigin = CGPoint(x: -75.05 * scaleX, y: -49.8 * scaleY)
        let rectOffset = CGRect(origin: rect.origin - offsetFromOrigin, size: rect.size)
        
        //// Color Declarations
        let fillColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.000)
        let fillColor2 = UIColor(red: 0.114, green: 0.114, blue: 0.106, alpha: 1.000)
        
        context.saveGState()
        context.setAlpha(0)
        
        var actions = [
            (state: BezierStates.move, position: CGPoint(x: 79.95, y: 49.79), controlPoint1: CGPoint(), controlPoint2: CGPoint())
        ]
        
        actions.append((
            state: BezierStates.curve,
            position: CGPoint(x: 80.48, y: 49.82),
            controlPoint1: CGPoint(x: 80.13, y: 49.79),
            controlPoint2: CGPoint(x: 80.3, y: 49.8)))
        
        actions.append((
            state: BezierStates.line,
            position: CGPoint(x: 169.05, y: 54.79),
            controlPoint1: CGPoint(),
            controlPoint2: CGPoint()))
        
        actions.append(
            (state: BezierStates.line, position: CGPoint(x: 80.48, y: 59.76), controlPoint1: CGPoint(), controlPoint2: CGPoint()))
        
        actions.append((
            state: BezierStates.curve,
            position: CGPoint(x: 79.95, y: 59.79),
            controlPoint1: CGPoint(x: 80.3, y: 59.78),
            controlPoint2: CGPoint(x: 80.13, y: 59.79)))
        
        actions.append((
            state: BezierStates.curve,
            position: CGPoint(x: 75.05, y: 54.79),
            controlPoint1: CGPoint(x: 77.24, y: 59.79),
            controlPoint2: CGPoint(x: 75.05, y: 57.55)))
        
        actions.append((
            state: BezierStates.curve,
            position: CGPoint(x: 79.95, y: 49.79),
            controlPoint1: CGPoint(x: 75.05, y: 52.03),
            controlPoint2: CGPoint(x: 77.24, y: 49.79)))
        
        let rectangle6Path = UIBezierPath(rect: rectOffset)
        fillColor.setFill()
        rectangle6Path.fill()
        context.restoreGState()
        
        //// Fill-8 Drawing
        let fill8Path = UIBezierPath()
        
        for action in actions {
            let position = CGPoint(x: action.position.x * scaleX, y: action.position.y * scaleY)
            let controlPoint1 = CGPoint(x: action.controlPoint1.x * scaleX, y: action.controlPoint1.y * scaleY)
            let controlPoint2 = CGPoint(x: action.controlPoint2.x * scaleX, y: action.controlPoint2.y * scaleY)
            
            switch action.state {
            case .move:
                fill8Path.move(to: position - rectOffset.origin)
            case .curve:
                fill8Path.addCurve(to: position - rectOffset.origin, controlPoint1: controlPoint1 - rectOffset.origin, controlPoint2: controlPoint2 - rectOffset.origin)
            case .line:
                fill8Path.addLine(to: position - rectOffset.origin)
            }
        }
        
        fill8Path.close()
        fill8Path.usesEvenOddFillRule = true
        fillColor2.setFill()
        fill8Path.fill()
    }
    
    open func rotate(angle: Double) {
        self.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        
        UIView.animate(withDuration: 3.0, animations: { () -> Void in
            self.transform = self.transform.rotated(by: CGFloat(angle))
        })
    }
}
