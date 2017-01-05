//
//  Lot5TableViewController.swift
//  zotDinning
//
//  Created by Yaroslav Dukal on 1/4/17.
//  Copyright © 2017 Yaro. All rights reserved.
//

import UIKit
import SafariServices

class Lot5TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        didTapMenuButton()
    }
    func didTapMenuButton() {
        if #available(iOS 9.0, *) {
            let vc = SFSafariViewController(url: LOT5_MENU_URL, entersReaderIfAvailable: false)
            if #available(iOS 10.0, *) {
                vc.preferredBarTintColor = .black
            } else {
                vc.view.tintColor = .black
                
            }
            present(vc, animated: true)
            
        } else {
            UIApplication.shared.openURL(LOT5_MENU_URL)
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? CGFloat(FLT_EPSILON) : 10
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
