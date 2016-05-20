//
//  ViewController.swift
//  Focus
//
//  Created by Sudeep Agarwal on 05/19/2016.
//  Copyright (c) 2016 Sudeep Agarwal. All rights reserved.
//

import UIKit
import Focus

class ViewController: UIViewController {
    
    var fv:FocusView!
    
    @IBOutlet var foodCardView: UIView!
    @IBOutlet var travelCardView: UIView!
    @IBOutlet var architectureCardView: UIView!
    @IBOutlet var workCardView: UIView!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create the FocusView and add it as a subview to the main view
        fv = FocusView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        // Specify the blur style
        fv.blurStyle = .Dark
        self.view.addSubview(fv)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if !fv.isActive() {
            let touch = touches.first
            let p = touch!.locationInView(self.view)
            let selectedView = view.hitTest(p, withEvent: nil)
            // Create a f
            fv.focusOnView(selectedView!, focusType: .Circle, focusStyle: .Blur)
        } else {
            fv.removeFocus()
        }
    }
    
}