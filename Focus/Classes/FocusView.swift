//
//  FocusView.swift
//  Pods
//
//  Created by Sudeep Agarwal on 5/19/16.
//
//

import Foundation
import UIKit

open class FocusView: UIView {
    
    public enum FocusType {
        case square
        case circle
    }
    
    public enum FocusStyle {
        case fade
        case blur
    }
    
    open var type: FocusType = .circle
    open var style: FocusStyle = .blur
    fileprivate var fillLayer: CAShapeLayer?
    fileprivate var active: Bool!
    
    // Translucency Properties
    open var opacity: Float = 0.5
    open var color: UIColor = UIColor.black
    
    // Blur Properties
    open var blurStyle: UIBlurEffectStyle = .dark
    fileprivate var blur: UIVisualEffectView?
    
    
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
        self.isUserInteractionEnabled = false
    }
    
    open func focusOnView(_ theView:UIView,
                            focusType type:FocusType = FocusType.circle,
                            focusStyle style:FocusStyle = FocusStyle.fade,
                            focusPadding padding:CGFloat = 0.0) {
        self.type = type
        self.style = style
        let rect = theView.superview!.convert(theView.frame, to: self)
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        var focusPath: UIBezierPath?
        switch type {
        case .circle:
            let diagonal = sqrt(pow(rect.width, 2) + pow(rect.height, 2))
            let radius = diagonal / 2 + padding
            focusPath = UIBezierPath(roundedRect: CGRect(x: rect.midX - radius, y: rect.midY - radius, width: 2*radius, height: 2*radius), cornerRadius: CGFloat(radius))
        case .square:
            focusPath = UIBezierPath(rect: CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.width, height: rect.height))
        }
        if let focusPath = focusPath {
            path.append(focusPath)
            path.usesEvenOddFillRule = true
            fillLayer = CAShapeLayer()
            fillLayer!.path = path.cgPath
            fillLayer!.fillRule = kCAFillRuleEvenOdd
            switch style {
            case .fade:
                fillLayer!.fillColor = color.cgColor
                fillLayer!.opacity = opacity
                self.layer.addSublayer(fillLayer!)
            case .blur:
                blur = UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
                blur!.frame = self.frame
                self.addSubview(blur!)
                blur!.layer.mask = fillLayer!
            }
            active = true
        }
        
    }
    
    open func removeFocus() {
        if isActive() {
            if style == .blur {
                blur!.removeFromSuperview()
                blur = nil
            }
            fillLayer!.removeFromSuperlayer()
            fillLayer = nil
            active = false
        }
    }
    
    open func isActive() -> Bool {
        return self.active
    }
    
    
}
