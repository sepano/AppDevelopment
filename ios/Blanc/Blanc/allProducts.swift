//
//  allProducts.swift
//  Blanc
//
//  Created by Boning Gong on 1/9/16.
//  Copyright © 2016 Blanc Essentials. All rights reserved.
//

import Foundation

class allProducts {
    
    private var listOfProducts:[Product] = [
    Product(name:"T-Shirt", id:1, imageUrls:["tshirt1v0.jpg", "tshirt1v1.jpg", "tshirt1v2.jpg"], normalPrice:25.00, salePrice:14.99, sale:false),
    Product(name:"Blazer", id:2, imageUrls:["blazer1v0.jpg", "blazer1v1.jpg", "blazer1v2.jpg", "blazer1v3.jpg"], normalPrice:225.00, salePrice:144.99, sale:true),
    Product(name:"Vest", id:3, imageUrls:["vest1v0.jpg", "vest1v1.jpg", "vest1v2.jpg", "vest1v3.jpg"], normalPrice:85.00, salePrice:55.00, sale:true) ]
    
    func getAllProducts() -> Array<Product> {
        return self.listOfProducts
    }
}