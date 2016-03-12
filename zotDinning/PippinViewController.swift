//
//  PippinViewController.swift
//  zotDinning
//
//  Created by Yaro on 12/3/15.
//  Copyright © 2015 Yaro. All rights reserved.
//

import UIKit

class PippinViewController: UIViewController {

    @IBOutlet weak var PippinScrollView: UIScrollView!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    @IBOutlet weak var pippinWebView: UIWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func PippinMenuButton(sender: UIButton) {
        
        let URL = NSURL(string: "https://uci.campusdish.com/Commerce/Catalog/Menus.aspx?LocationId=4832")
        pippinWebView.loadRequest(NSURLRequest(URL: URL!))
        PippinScrollView.bringSubviewToFront(pippinWebView)
        pippinWebView.backgroundColor = UIColor.whiteColor()
        PippinScrollView.bringSubviewToFront(progressIndicator)
        
        self.backButton.action = NSSelectorFromString("backToPippin:")
    }
    
    func backToPippin (sender: UIBarButtonItem)
    {
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("PippinViewController") as! PippinViewController
        self.presentViewController(next, animated: true, completion: nil)
    }
    
    @IBAction func backBtn(sender: UIBarButtonItem) {
        
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("FirstViewController") as! FirstViewController
        self.presentViewController(next, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let statusFrame = CGRectMake(0.0, 0, self.view.bounds.size.width,
            UIApplication.sharedApplication().statusBarFrame.size.height)
        let statusBar = UIView(frame: statusFrame)
        statusBar.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(statusBar)
        
        PippinScrollView.contentSize.height = 850
        
        //Scales the progressIndicator to bigger size
        let transform : CGAffineTransform = CGAffineTransformMakeScale(1.5, 1.5)
        progressIndicator.transform = transform
    }
    
    func webViewDidStartLoad (_ :UIWebView)
    {
        self.PippinScrollView.userInteractionEnabled = false
        self.progressIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad (_ : UIWebView)
    {
        self.progressIndicator.stopAnimating()
        self.PippinScrollView.userInteractionEnabled = true
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
