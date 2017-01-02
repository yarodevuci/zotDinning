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
    @IBAction func menuButton(_ sender: UIButton) {
        
        let link = URL(string: "https://uci.campusdish.com/Commerce/Catalog/Menus.aspx?LocationId=3056")
        webPage.loadRequest(URLRequest(url: link!))
        lot5ScrollView.bringSubview(toFront: webPage)
        lot5ScrollView.bringSubview(toFront: progressIndicator)
        
        
        self.backButtonOutlet.tintColor = UIColor.black
        self.backButtonOutlet.image = UIImage(named: "backArrow.png")
        self.backButtonOutlet.title = ""
        
        self.backButtonOutlet.action = NSSelectorFromString("backToLot5:")
        
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
         self.present(next, animated: true, completion: nil)
    }
    
    func backToLot5(_ sender: UIBarButtonItem!) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "Lot5ViewController") as! Lot5ViewController
        self.present(next, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this block of code will keep status bar visible and scroll view will go under it
        let statusFrame = CGRect(x: 0.0, y: 0, width: self.view.bounds.size.width,
                                     height: UIApplication.shared.statusBarFrame.size.height)
        let statusBar = UIView(frame: statusFrame)
        statusBar.backgroundColor = UIColor.white
        self.view.addSubview(statusBar)
        
        lot5ScrollView.contentSize.height = 550
        
        //Scale the progressBar Indicator
        let transform : CGAffineTransform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        progressIndicator.transform = transform
        
    }
    
    func webViewDidStartLoad (_ :UIWebView)
    {
        self.progressIndicator.startAnimating()
        self.lot5ScrollView.isUserInteractionEnabled = false
    }
    
    func webViewDidFinishLoad (_ : UIWebView)
    {
        self.progressIndicator.stopAnimating()
        self.lot5ScrollView.isUserInteractionEnabled = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
