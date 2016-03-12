//
//  BrandywineViewController.swift
//  zotDinning
//
//  Created by Yaro on 11/26/15.
//  Copyright © 2015 Yaro. All rights reserved.
//

import UIKit

class BrandywineViewController: UIViewController {
    
    
    @IBOutlet weak var brandyWebView: UIWebView!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    @IBOutlet weak var BrandyScrollView: UIScrollView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func menuButton(sender: UIButton)
    {
        let URL = NSURL(string: "https://uci.campusdish.com/Commerce/Catalog/Menus.aspx?LocationId=3078")
        brandyWebView.loadRequest(NSURLRequest(URL: URL!))
        BrandyScrollView.bringSubviewToFront(brandyWebView)
        brandyWebView.backgroundColor = UIColor.whiteColor()
        BrandyScrollView.bringSubviewToFront(progressIndicator)
        
        self.backButton.action = NSSelectorFromString("backToBrandy:")
        
    }
    
    func backToBrandy (sender: UIBarButtonItem!)
    {
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("BrandywineViewController") as! BrandywineViewController
        self.presentViewController(next, animated: true, completion: nil)
    }
    
    @IBAction func backBtn(sender: UIBarButtonItem) {
        
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("FirstViewController") as! FirstViewController
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
        
        BrandyScrollView.contentSize.height = 530
        
        let transform : CGAffineTransform = CGAffineTransformMakeScale(1.5, 1.5)
        progressIndicator.transform = transform
        
    }
    
    func webViewDidStartLoad (_: UIWebView)
    {
        self.progressIndicator.startAnimating()
        self.BrandyScrollView.userInteractionEnabled = false

    }
    
    func webViewDidFinishLoad (_: UIWebView)
    {
        self.progressIndicator.stopAnimating()
        self.BrandyScrollView.userInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
