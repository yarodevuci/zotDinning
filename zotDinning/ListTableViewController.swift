//
//  ListTableViewController.swift
//  zotDinning
//
//  Created by Yaroslav Dukal on 1/5/17.
//  Copyright © 2017 Yaro. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    let sectionTitles = ["Residential", "Retail"]
    
    var list = [CafeInfo]()
    var listFiltered = [CafeInfo]()
    var sections = [[CafeInfo](), [CafeInfo]()]
    
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Properties of our searchbar
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.keyboardAppearance = .dark
        self.tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        
        self.tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        populateList()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapMapIcon(_ sender: Any) {
        self.presentViewController(withIdentifier: "MapViewController", animated: false)
    }
    
    
    func populateList() {
        var myDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "List", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        let dict = myDict?["list"] as! [AnyObject]
        for (index, item) in dict.enumerated() {
            
            let stObject = CafeInfo()
            stObject.name = (item["name"] as? String)!
            stObject.imageName = (item["image"] as? String)!
            stObject.address = (item["address"] as? String)!
            stObject.cafeDescription = (item["description"] as? String)!
            stObject.phonenumber = (item["phonenumber"] as? String)!
            stObject.email = (item["email"] as? String)!
            stObject.hours = (item["hours"] as? String)!
            
            if index == 0 || index == 1 {
                sections[0].append(stObject)
            } else {
                sections[1].append(stObject)
            }
            list.append(stObject)
        }
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        headerLabel.text = "   " + sectionTitles[section]
        headerLabel.sizeToFit()
        headerLabel.textColor = .black
        headerLabel.textAlignment = .left
        headerLabel.backgroundColor =  UIColor(red:0.91, green:0.93, blue:0.93, alpha:1.0)
        
        return headerLabel
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return searchController.isActive ? CGFloat(FLT_EPSILON) : CGFloat(30)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return searchController.isActive ? 1 : 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchController.isActive {
            return listFiltered.count
        }
        return section == 0 ? 2 : 13
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        
        if self.searchController.isActive {
            cell.name.text = listFiltered[indexPath.row].name
            cell.cafeImage.image = UIImage(named: listFiltered[indexPath.row].imageName)
            return cell
        }
        let index = sections[indexPath.section][indexPath.row]
        cell.name.text = index.name
        cell.cafeImage.image = UIImage(named: index.imageName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.searchController.isActive {
            RetailInfoTableViewController.cafeInfo = listFiltered[indexPath.row]
        } else {
            RetailInfoTableViewController.cafeInfo = sections[indexPath.section][indexPath.row]
        }
        
        self.pushViewController(withIdentifier: "RetailInfoTableViewController")
    }
    
    
}

extension ListTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        self.listFiltered.removeAll()
        let searchText = searchController.searchBar.text!.lowercased()
        listFiltered = list.filter { ($0.name as NSString).localizedCaseInsensitiveContains("\(searchText)")}
        tableView.reloadData()
    }
}
