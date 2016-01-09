//
//  ProductOverviewTableViewController.swift
//  Blanc
//
//  Created by Boning Gong on 1/7/16.
//  Copyright © 2016 Blanc Essentials. All rights reserved.
//

import Foundation

class ProductOverviewTableViewController : UITableViewController {
    
    @IBOutlet weak var Menu: UIBarButtonItem!
    var products:[Product] = allProducts().getAllProducts();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Alle producten"
        
        Menu.target = self.revealViewController()
        Menu.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showProductDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! ProductDetailViewController
                destinationController.curItemIndex = indexPath.row
                destinationController.productName = products[indexPath.row].getName()
                destinationController.imageURL = products[indexPath.row].getImageUrls()[0]
                destinationController.productNormalPriceDouble = products[indexPath.row].getNormalPrice()
                destinationController.productSalePriceDouble = products[indexPath.row].getSalePrice()
                destinationController.isOnSale = products[indexPath.row].getOnSale()
            }
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cellIdentifier = "productCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ProductOverviewTableViewCell
        
        // Configuring the cell
        cell.productName.text = products[indexPath.row].getName()
        cell.productImage.image = UIImage(named: products[indexPath.row].getImageUrls()[0])
        cell.productImage.contentMode = UIViewContentMode.ScaleAspectFit
        
        if( products[indexPath.row].getOnSale() ) {
            let normalPrice:String = String(format:"%.2f", products[indexPath.row].getNormalPrice())
            let salePrice:String = String(format:"%.2f", products[indexPath.row].getSalePrice())
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:"€" + normalPrice)
            attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 1, range: NSMakeRange(0, attributeString.length))
            cell.productNormalPrice.attributedText = attributeString
            cell.productSalePrice.text = "€" + salePrice
        }
            else {
            let normalPrice:String = String(format:"%.2f", products[indexPath.row].getNormalPrice())
            cell.productNormalPrice.text = "€" + normalPrice
            cell.productSalePrice.text = nil
        }
            
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}