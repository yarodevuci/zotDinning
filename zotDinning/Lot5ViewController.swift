//
//  Lot5ViewController.swift
//  zotDinning
//
//  Created by Yaro on 11/26/15.
//  Copyright © 2015 Yaro. All rights reserved.
//

import UIKit

class Lot5ViewController: UIViewController {

    
    @IBOutlet weak var webPage: UIWebView!
    
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    @IBOutlet weak var lot5ScrollView: UIScrollView!
    
    @IBOutlet weak var backButtonOutlet: UIBarButtonItem!
    @IBAction func menuButton(sender: UIButton) {
        
        let link = NSURL(string: "https://uci.campusdish.com/Commerce/Catalog/Menus.aspx?LocationId=3056")
        webPage.loadRequest(NSURLRequest(URL: link!))
        lot5ScrollView.bringSubviewToFront(webPage)
        lot5ScrollView.bringSubviewToFront(progressIndicator)
        
        
        self.backButtonOutlet.tintColor = UIColor.blackColor()
        self.backButtonOutlet.image = UIImage(named: "backArrow.png")
        self.backButtonOutlet.title = ""
        
        self.backButtonOutlet.action = NSSelectorFromString("backToLot5:")
        
    }
    
    @IBAction func backButton(sender: UIBarButtonItem) {
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("FirstViewController") as! FirstViewController
        self.presentViewController(next, animated: true, completion: nil)
        
    }
    
    func backToLot5(sender: UIBarButtonItem!) {
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("Lot5ViewController") as! Lot5ViewController
        self.presentViewController(next, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //this block of code will keep status bar visible and scroll view will go under it
        let statusFrame = CGRectMake(0.0, 0, self.view.bounds.size.width,
            UIApplication.sharedApplication().statusBarFrame.size.height)
        let statusBar = UIView(frame: statusFrame)
        statusBar.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(statusBar)
        
        lot5ScrollView.contentSize.height = 550
        
        //Scale the progressBar Indicator
        let transform : CGAffineTransform = CGAffineTransformMakeScale(1.5, 1.5)
        progressIndicator.transform = transform
        
    }
    
    func webViewDidStartLoad (_ :UIWebView)
    {
        self.progressIndicator.startAnimating()
        self.lot5ScrollView.userInteractionEnabled = false
    }
    
    func webViewDidFinishLoad (_ : UIWebView)
    {
     self.progressIndicator.stopAnimating()
     self.lot5ScrollView.userInteractionEnabled = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
