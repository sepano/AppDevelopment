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
    private var urlImg = "";
    private var id = 0;
    
    init(name:String, urlImg:String, id:Int) {
        self.name = name;
        self.urlImg = urlImg;
        self.id = id;
    }
    
    func getName() -> String {
        return self.name;
    }
    
    func getUrlImg() -> String {
        return self.urlImg;
    }
    
    func getId() -> Int {
        return self.id;
    }
    
}