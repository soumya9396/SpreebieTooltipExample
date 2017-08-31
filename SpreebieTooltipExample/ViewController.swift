//
//  ViewController.swift
//  SpreebieTooltipExample
//
//  Created by Thabo David Klass on 30/08/2017.
//  Copyright © 2017 Open Beacon. All rights reserved.
//

import UIKit
import EasyTipView

class ViewController: UIViewController, EasyTipViewDelegate {
    /// The superview
    @IBOutlet var mainView: UIView!
    
    /// The view that's going to have a popup
    @IBOutlet weak var toolTipButton: UIButton!

    /// Easy Tips View Preferences
    var preferences = EasyTipView.Preferences()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /// Configure the preferences
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = UIColor(red: 112.0/255.0, green: 213.0/255.0, blue: 211.0/255.0, alpha: 1.0)
        
        /// Show the tooltip
        showTooltip()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showTooltip() {
        /// Wait 2.5 seconds before showing the tooltip
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
            /// Show the tooltip
            EasyTipView.show(forView: self.toolTipButton,  withinSuperview: self.mainView, text: "This is an an example of a tooltip! Tap to dismiss!", preferences: self.preferences, delegate: self)
        })
    }
    
    func easyTipViewDidDismiss(_ tipView: EasyTipView) {
        /// Do nothing
    }
}

