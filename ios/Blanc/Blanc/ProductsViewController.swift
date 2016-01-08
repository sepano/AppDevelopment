//
//  Products.swift
//  Blanc
//
//  Created by Boning Gong on 1/7/16.
//  Copyright © 2016 Blanc Essentials. All rights reserved.
//

import Foundation

class ProductsViewController : UIViewController {
    
    @IBOutlet weak var Menu: UIBarButtonItem!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var productNormalPrice: UILabel!
    @IBOutlet weak var productSalePrice: UILabel!
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var addItemButton: UIButton!
    
    var testItem = Product(name:"T-Shirt", id:1, imageUrls:["tshirt1.jpg", "tshirt2.jpg", "tshirt3.jpg"], normalPrice:25.00, salePrice:14.99, sale:false)
    var curImageIndex = 1

    // Show higher standing image
    @IBAction func upSwipe(sender: AnyObject) {
        ++curImageIndex
        if( curImageIndex >= testItem.getImageUrls().count ) {
            curImageIndex = testItem.getImageUrls().count - 1
        }
        
        imageView.image = UIImage(named: testItem.getImageUrls()[curImageIndex])
    }
    
    // Show lower standing image
    @IBAction func downSwipe(sender: AnyObject) {
        --curImageIndex
        if( curImageIndex < 0 ) {
            curImageIndex = 0
        }
        
        imageView.image = UIImage(named: testItem.getImageUrls()[curImageIndex])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Menu.target = self.revealViewController()
        Menu.action = Selector("revealToggle:")
        
        // Styling the buttons
        addItemButton.layer.cornerRadius = 2;
        addItemButton.layer.borderWidth = 0.5;
        addItemButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        infoButton.layer.cornerRadius = 2;
        infoButton.layer.borderWidth = 0.5;
        infoButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        // Option to swipe open the navigation menu
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Adding all information from an product
        imageView.image = UIImage(named: testItem.getImageUrls()[curImageIndex])
        
        if( testItem.getOnSale() ) {
            let normalPrice:String = String(format:"%.2f", testItem.getNormalPrice())
            let salePrice:String = String(format:"%.2f", testItem.getSalePrice())
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:"€" + normalPrice)
            attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 1, range: NSMakeRange(0, attributeString.length))
            productNormalPrice.attributedText = attributeString
            productSalePrice.text = "€" + salePrice
        }
        else {
            let normalPrice:String = String(format:"%.2f", testItem.getNormalPrice())
            productNormalPrice.text = "€" + normalPrice
            productSalePrice.text = nil
        }
        
        
    }
}