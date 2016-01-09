//
//  ProductOverviewTableViewCell.swift
//  Blanc
//
//  Created by Boning Gong on 1/9/16.
//  Copyright © 2016 Blanc Essentials. All rights reserved.
//

import UIKit

class ProductOverviewTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productNormalPrice: UILabel!
    @IBOutlet weak var productSalePrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
