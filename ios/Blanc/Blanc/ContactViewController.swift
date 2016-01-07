//
//  ContactViewController.swift
//  Blanc
//
//  Created by Boning Gong on 1/7/16.
//  Copyright © 2016 Blanc Essentials. All rights reserved.
//

import Foundation

class ContactViewController : UIViewController {
    
    @IBOutlet weak var Menu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Menu.target = self.revealViewController()
        Menu.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
}