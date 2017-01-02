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
    
    @IBAction func menuButton(_ sender: UIButton)
    {
        let URL = Foundation.URL(string: "https://uci.campusdish.com/Commerce/Catalog/Menus.aspx?LocationId=3078")
        brandyWebView.loadRequest(URLRequest(url: URL!))
        BrandyScrollView.bringSubview(toFront: brandyWebView)
        brandyWebView.backgroundColor = UIColor.white
        BrandyScrollView.bringSubview(toFront: progressIndicator)
        
        self.backButton.action = NSSelectorFromString("backToBrandy:")
        
    }
    
    func backToBrandy (_ sender: UIBarButtonItem!)
    {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "BrandywineViewController") as! BrandywineViewController
        self.present(next, animated: true, completion: nil)
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
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
        
        BrandyScrollView.contentSize.height = 530
        
        let transform : CGAffineTransform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        progressIndicator.transform = transform
        
    }
    
    func webViewDidStartLoad (_: UIWebView)
    {
        self.progressIndicator.startAnimating()
        self.BrandyScrollView.isUserInteractionEnabled = false

    }
    
    func webViewDidFinishLoad (_: UIWebView)
    {
        self.progressIndicator.stopAnimating()
        self.BrandyScrollView.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
