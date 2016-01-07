//
//  ViewController.swift
//  Blanc
//
//  Created by Boning Gong on 1/4/16.
//  Copyright © 2016 Blanc Essentials. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Menu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        Menu.target = self.revealViewController()
        Menu.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.customizeSlideOutMenu()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Set all options related to the slide out navigation menu
    func customizeSlideOutMenu() {
        if self.revealViewController() != nil {
            // INITIAL APPEARANCE: Configure the initial position of the menu and content views
            self.revealViewController().rearViewRevealWidth = 225.0; // how much of the menu is shown (default 260.0)
            
            // TOGGLING OVERDRAW: Configure the overdraw appearance of the content view while dragging it
            self.revealViewController().rearViewRevealOverdraw = 0.0; // how much of an overdraw can occur when dragging further than 'rearViewRevealWidth' (default 60.0)
            self.revealViewController().bounceBackOnOverdraw = false; // If YES the controller will bounce to the Left position when dragging further than 'rearViewRevealWidth' (default YES)
            
            // TOGGLING MENU DISPLACEMENT: how much displacement is applied to the menu when animating or dragging the content
            self.revealViewController().rearViewRevealDisplacement = 100.0; // (default 40.0)
            
            // TOGGLING ANIMATION: Configure the animation while the menu gets hidden
            self.revealViewController().toggleAnimationDuration = 0.75; // Duration for the revealToggle animation (default 0.25)
            self.revealViewController().springDampingRatio = 1.0; // damping ratio if SWRevealToggleAnimationTypeSpring (default 1.0)
            
            // SHADOW: Configure the shadow that appears between the menu and content views
            self.revealViewController().frontViewShadowRadius = 0.25; // radius of the front view's shadow (default 2.5)
            self.revealViewController().frontViewShadowOffset = CGSizeMake(0.0, 0.0); // radius of the front view's shadow offset (default {0.0f,2.5f})
            self.revealViewController().frontViewShadowOpacity = 1.0; // front view's shadow opacity (default 1.0)
            self.revealViewController().frontViewShadowColor = UIColor.darkGrayColor(); // front view's shadow color (default blackColor)
        }
    }
}

