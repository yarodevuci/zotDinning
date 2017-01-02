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
    
    
//    //Function to get calendar data
//    func getCallendarInfo () -> DateComponents
//    {
//        let currentDateTime = Date()
//        // get the user's calendar
//        let userCalendar = Calendar.current
//        // choose which date and time components are needed
//        let requestedComponents: Calendar.dateTimeComponents = [
//            Calendar.dateTimeComponents.year,
//            Calendar.dateTimeComponents.month,
//            Calendar.dateTimeComponents.day,
//            Calendar.dateTimeComponents.hour,
//            Calendar.dateTimeComponents.minute,
//            Calendar.dateTimeComponents.weekday
//        ]
//        // get the components
//        let dateTimeComponents = (userCalendar as Calendar).components(requestedComponents, from: currentDateTime)
//        return dateTimeComponents
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
