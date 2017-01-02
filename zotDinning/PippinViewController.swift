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
    
    @IBAction func PippinMenuButton(_ sender: UIButton) {
        
        let URL = Foundation.URL(string: "https://uci.campusdish.com/Commerce/Catalog/Menus.aspx?LocationId=4832")
        pippinWebView.loadRequest(URLRequest(url: URL!))
        PippinScrollView.bringSubview(toFront: pippinWebView)
        pippinWebView.backgroundColor = UIColor.white
        PippinScrollView.bringSubview(toFront: progressIndicator)
        
        self.backButton.action = NSSelectorFromString("backToPippin:")
    }
    
    func backToPippin (_ sender: UIBarButtonItem)
    {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "PippinViewController") as! PippinViewController
        self.present(next, animated: true, completion: nil)
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        self.present(next, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let statusFrame = CGRect(x: 0.0, y: 0, width: self.view.bounds.size.width,
            height: UIApplication.shared.statusBarFrame.size.height)
        let statusBar = UIView(frame: statusFrame)
        statusBar.backgroundColor = UIColor.white
        self.view.addSubview(statusBar)
        
        PippinScrollView.contentSize.height = 850
        
        //Scales the progressIndicator to bigger size
        let transform : CGAffineTransform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        progressIndicator.transform = transform
    }
    
    func webViewDidStartLoad (_ :UIWebView)
    {
        self.PippinScrollView.isUserInteractionEnabled = false
        self.progressIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad (_ : UIWebView)
    {
        self.progressIndicator.stopAnimating()
        self.PippinScrollView.isUserInteractionEnabled = true
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
