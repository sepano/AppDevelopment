//
//  Product.swift
//  Blanc
//
//  Created by Boning Gong on 1/7/16.
//  Copyright © 2016 Blanc Essentials. All rights reserved.
//

import Foundation

class Product {
    
    private var name = "";
    private var id = 0;
    
    private var imageUrls = [String]();
    private var normalPrice = 0.0;
    private var salePrice = 0.0;
    private var sale = false;
    
    init(name:String, id:Int, imageUrls:Array<String>, normalPrice:Double, salePrice:Double, sale:Bool) {
        self.name = name;
        self.id = id;
        
        self.imageUrls = imageUrls;
        self.normalPrice = normalPrice;
        self.salePrice = salePrice;
        self.sale = sale;
    }
    
    func getName() -> String {
        return self.name;
    }
    
    func setName(newName:String) {
        self.name = newName;
    }
    
    func getId() -> Int {
        return self.id;
    }
    
    func setId(newId:Int) {
        self.id = newId;
    }
    
    func getImageUrls() -> Array<String> {
        return self.imageUrls;
    }
    
    func setImageUrls(newUrls:Array<String>) {
        self.imageUrls = newUrls;
    }
    
    func getNormalPrice() -> Double {
        return self.normalPrice;
    }
    
    func setNormalPrice(newNormalPrice:Double) {
        self.normalPrice = newNormalPrice;
    }
    
    func getSalePrice() -> Double {
        return self.salePrice;
    }
    
    func setSalePrice(newSalePrice:Double) {
        self.normalPrice = newSalePrice;
    }
    
    func getOnSale() -> Bool {
        return self.sale;
    }
    
    func notOnSale() {
        self.sale = false;
    }
    
    func onSale() {
        self.sale = true;
    }
    
}