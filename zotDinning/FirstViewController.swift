//
//  FirstViewController.swift
//  zotDinning
//
//  Created by Yaro on 11/26/15.
//  Copyright © 2015 Yaro. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    func displayStatusForBrandywine () -> String {
        
        let date = Date()
        let hour = Calendar.current.component(.hour, from: date)
        let weekday = Calendar.current.component(.weekday, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        var status: String = ""

        if ((weekday >= 2 && weekday <= 5) && (hour >= 10 && hour <= 23) && (minute <= 59 && hour != 0) || ((weekday == 6 && hour >= 10 && minute >= 30 && hour <= 21) || (weekday == 6 && hour >= 11 && (hour <= 21 && minute < 0))))
        {
            status = "Open"
        }
        else
        {
            status = "Closed"
        }
        return status
    }
    
    func displayStatusforLot5 () -> String {
        
        let date = Date()
        let hour = Calendar.current.component(.hour, from: date)
        let weekday = Calendar.current.component(.weekday, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        var status: String = ""
        
        if ((weekday >= 2 && weekday <= 6 && hour >= 7 && hour <= 19) && (minute <= 59))
        {
            status = "Open"
        }
        else
        {
            status = "Closed"
        }
        return status
    }
    
}

