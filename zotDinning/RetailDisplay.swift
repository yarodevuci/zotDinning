//
//  RetailDisplay.swift
//  zotDinning
//
//  Created by Yaro on 12/18/15.
//  Copyright © 2015 Yaro. All rights reserved.
//  Retail Display

import Foundation
import UIKit

class RetailDisplay: UIViewController {
    
    //Declaring variables 
    @IBOutlet weak var retailDisplayScrollView: UIScrollView!
    @IBOutlet weak var retailImage: UIImageView!
    
    @IBOutlet weak var hoursField: UITextView!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var addressField: UITextView!
    @IBOutlet weak var phoneField: UITextView!
    @IBOutlet weak var emailField: UITextView!
    
    
    @IBOutlet weak var navbar: UINavigationBar!
    
    var retImage = UIImage()
    var titleName = String()
    
    var hours:String = ""
    var descriptionF:String = ""
    var address:String = ""
    var phoneNum:String = ""
    var email:String = ""
    
    
    @IBAction func backButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
    
        retailDisplayScrollView.contentSize.height = 850
    
        navbar.topItem!.title = titleName
        retailImage.image = retImage
        
        hoursField.text = hours
        descriptionField.text = descriptionF
        addressField.text = address
        phoneField.text = phoneNum
        emailField.text = email
    }
    
}
