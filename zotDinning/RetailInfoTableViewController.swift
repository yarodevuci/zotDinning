//
//  RetailInfoTableViewController.swift
//  zotDinning
//
//  Created by Yaroslav Dukal on 1/4/17.
//  Copyright © 2017 Yaro. All rights reserved.
//

import UIKit

class RetailInfoTableViewController: UITableViewController {
    
    
    @IBOutlet weak var retailImage: UIImageView!
    @IBOutlet weak var retailHours: UITextView!
    @IBOutlet weak var retailDescription: UITextView!
    @IBOutlet weak var retailPhoneEmail: UITextView!

    
    static var cafeInfo: CafeInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = RetailInfoTableViewController.cafeInfo?.name
        tableView.estimatedRowHeight = 140

        retailImage.image = UIImage(named: (RetailInfoTableViewController.cafeInfo?.imageName)!)
        retailHours.text = RetailInfoTableViewController.cafeInfo.hours
        retailDescription.text = RetailInfoTableViewController.cafeInfo.cafeDescription + "\n\n" + RetailInfoTableViewController.cafeInfo.address
        retailPhoneEmail.text = "Phone: " + RetailInfoTableViewController.cafeInfo.phonenumber + "\n" + "Email: " + RetailInfoTableViewController.cafeInfo.email

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? CGFloat(FLT_EPSILON) : 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        header.textLabel?.textColor = .black
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Hours"
        case 2:
            return "Description and Address"
        case 3:
            return "Contact Info"
        default:
            return ""
        }
    }

}
