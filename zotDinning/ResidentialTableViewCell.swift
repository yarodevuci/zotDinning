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
    
    
    //Function to get calendar data
    func getCallendarInfo () -> NSDateComponents
    {
        let currentDateTime = NSDate()
        // get the user's calendar
        let userCalendar = NSCalendar.currentCalendar()
        // choose which date and time components are needed
        let requestedComponents: NSCalendarUnit = [
            NSCalendarUnit.Year,
            NSCalendarUnit.Month,
            NSCalendarUnit.Day,
            NSCalendarUnit.Hour,
            NSCalendarUnit.Minute,
            NSCalendarUnit.Weekday
        ]
        // get the components
        let dateTimeComponents = userCalendar.components(requestedComponents, fromDate: currentDateTime)
        return dateTimeComponents
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
