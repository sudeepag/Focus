//
//  FocusView.swift
//  Pods
//
//  Created by Sudeep Agarwal on 5/19/16.
//
//

import Foundation
import UIKit

public class FocusView: UIView {
    
    public enum FocusType {
        case Square
        case Circle
    }
    
    public enum FocusStyle {
        case Fade
        case Blur
    }
    
    public var type: FocusType = .Circle
    public var style: FocusStyle = .Blur
    private var fillLayer: CAShapeLayer?
    private var active: Bool!
    
    // Translucency Properties
    public var opacity: Float = 0.5
    public var color: UIColor = UIColor.blackColor()
    
    // Blur Properties
    public var blurStyle: UIBlurEffectStyle = .Dark
    private var blur: UIVisualEffectView?
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        active = false
        self.userInteractionEnabled = false
    }
    
    public func focusOnView(theView:UIView,
                            focusType type:FocusType = FocusType.Circle,
                            focusStyle style:FocusStyle = FocusStyle.Fade,
                            focusPadding padding:CGFloat = 0.0) {
        self.type = type
        self.style = style
        let rect = theView.superview!.convertRect(theView.frame, toView: self)
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        var focusPath: UIBezierPath?
        switch type {
        case .Circle:
            let diagonal = sqrt(pow(rect.width, 2) + pow(rect.height, 2))
            let radius = diagonal / 2 + padding
            focusPath = UIBezierPath(roundedRect: CGRect(x: rect.midX - radius, y: rect.midY - radius, width: 2*radius, height: 2*radius), cornerRadius: CGFloat(radius))
        case .Square:
            focusPath = UIBezierPath(rect: CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.width, height: rect.height))
        }
        if let focusPath = focusPath {
            path.appendPath(focusPath)
            path.usesEvenOddFillRule = true
            fillLayer = CAShapeLayer()
            fillLayer!.path = path.CGPath
            fillLayer!.fillRule = kCAFillRuleEvenOdd
            switch style {
            case .Fade:
                fillLayer!.fillColor = color.CGColor
                fillLayer!.opacity = opacity
                self.layer.addSublayer(fillLayer!)
            case .Blur:
                blur = UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
                blur!.frame = self.frame
                self.addSubview(blur!)
                blur!.layer.mask = fillLayer!
            }
            active = true
        }
        
    }
    
    public func removeFocus() {
        if isActive() {
            if style == .Blur {
                blur!.removeFromSuperview()
                blur = nil
            }
            fillLayer!.removeFromSuperlayer()
            fillLayer = nil
            active = false
        }
    }
    
    public func isActive() -> Bool {
        return self.active
    }
    
    
}