//
//  ResidentialTableViewCell.swift
//  zotDining
//
//  Created by Yaro on 11/25/15.
//  Copyright © 2015 Yaro. All rights reserved.
//

import UIKit

class ResidentialTableViewCell: UITableViewCell {

    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var openStatus: UILabel!
    
    @IBOutlet weak var RetailImage: UIImageView!
    @IBOutlet weak var RetailLabel: UILabel!
    
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
