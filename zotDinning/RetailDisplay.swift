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
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        self.presentViewController(next, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        
        
        let statusFrame = CGRectMake(0.0, 0, self.view.bounds.size.width, UIApplication.sharedApplication().statusBarFrame.size.height)
        let statusBar = UIView(frame: statusFrame)
        statusBar.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(statusBar)
        
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
