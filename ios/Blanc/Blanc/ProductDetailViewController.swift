//
//  ProductDetailViewController.swift
//  Blanc
//
//  Created by Boning Gong on 1/7/16.
//  Copyright © 2016 Blanc Essentials. All rights reserved.
//

import Foundation

class ProductDetailViewController : UIViewController {
    
    @IBOutlet weak var Menu: UIBarButtonItem!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var productNormalPrice: UILabel!
    @IBOutlet weak var productSalePrice: UILabel!
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var addItemButton: UIButton!
    
    var products:[Product] = allProducts().getAllProducts();
    var curItemIndex = 0
    var curImageIndex = 0
    
    // Show other products on the right or left
    @IBAction func rightSwipe(sender: AnyObject) {
        ++curItemIndex
        curImageIndex = 0
        if (curItemIndex >= products.count ) {
            curItemIndex = products.count - 1
        }
        reloadProductInformation()
    }
    @IBAction func leftSwipe(sender: AnyObject) {
        --curItemIndex
        curImageIndex = 0
        if (curItemIndex < 0 ) {
            curItemIndex = 0
        }
        reloadProductInformation()
    }

    // Show higher standing image
    @IBAction func upSwipe(sender: AnyObject) {
        ++curImageIndex
        if( curImageIndex >= products[curItemIndex].getImageUrls().count ) {
            curImageIndex = products[curItemIndex].getImageUrls().count - 1
        }
        
        imageView.image = UIImage(named: products[curItemIndex].getImageUrls()[curImageIndex])
    }
    // Show lower standing image
    @IBAction func downSwipe(sender: AnyObject) {
        --curImageIndex
        if( curImageIndex < 0 ) {
            curImageIndex = 0
        }
        
        imageView.image = UIImage(named: products[curItemIndex].getImageUrls()[curImageIndex])
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
        //self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Adding all information from the initial product
        reloadProductInformation()
    }
    
    func reloadProductInformation() {
        self.title = products[curItemIndex].getName()
        imageView.image = UIImage(named: products[curItemIndex].getImageUrls()[curImageIndex])
        
        if( products[curItemIndex].getOnSale() ) {
            let normalPrice:String = String(format:"%.2f", products[curItemIndex].getNormalPrice())
            let salePrice:String = String(format:"%.2f", products[curItemIndex].getSalePrice())
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:"€" + normalPrice)
            attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 1, range: NSMakeRange(0, attributeString.length))
            productNormalPrice.attributedText = attributeString
            productSalePrice.text = "€" + salePrice
        }
        else {
            let normalPrice:String = String(format:"%.2f", products[curItemIndex].getNormalPrice())
            productNormalPrice.text = "€" + normalPrice
            productSalePrice.text = nil
        }
    }
}