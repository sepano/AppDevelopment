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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

