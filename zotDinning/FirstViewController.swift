//
//  FirstViewController.swift
//  zotDinning
//
//  Created by Yaro on 11/26/15.
//  Copyright © 2015 Yaro. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate {
    
    @IBOutlet weak var myButton: UIButton!
    
    var ResidentialPlacesArray = ["Lot 5", "Brandywine", "Pippin"]
    var ResidentialImagesArray = ["Lot5.jpg", "Brandywine.jpg", "Pippin.jpg"]
    
    weak var ResTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.isEnabled = false
        
        navigationController?.navigationBar.barTintColor = UIColor(red:0.91, green:0.93, blue:0.93, alpha:1.0)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .black

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ResidentialImagesArray.count
    }
    
    //Display info in our Residential cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ResidentialTableViewCell
        let entry = ResidentialPlacesArray[indexPath.row]
        let image = UIImage(named: ResidentialImagesArray[indexPath.row])
        cell.backgroundImage.image = image
        cell.headingLabel.text = entry

        switch indexPath.row {
        case 0:
            cell.openStatus.text = displayStatusforLot5()
            if displayStatusforLot5() == "Open"
            {
                cell.openStatus.textColor = UIColor.green
            }
        case 1:
            cell.openStatus.text = displayStatusForBrandywine()
            if displayStatusForBrandywine() == "Open"
            {
                cell.openStatus.textColor = UIColor.green
            }
        case 2:
            cell.openStatus.text = displayStatusforLot5()
            if displayStatusforLot5() == "Open"
            {
                cell.openStatus.textColor = UIColor.green
            }
        default:
            break
        }
        
        return cell
    }
    
    func displayStatusForBrandywine () -> String {
        
        let date = Date()
        let hour = Calendar.current.component(.hour, from: date)
        let weekday = Calendar.current.component(.weekday, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        var status: String = ""

        if ((weekday >= 2 && weekday <= 5) && (hour >= 10 && hour <= 23) && (minute <= 59 && hour != 0) || ((weekday == 6 && hour >= 10 && minute >= 30 && hour <= 21) || (weekday == 6 && hour >= 11 && (hour <= 21 && minute < 0))))
        {
            status = "Open"
        }
        else
        {
            status = "Closed"
        }
        return status
    }
    
    func displayStatusforLot5 () -> String {
        
        let date = Date()
        let hour = Calendar.current.component(.hour, from: date)
        let weekday = Calendar.current.component(.weekday, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        var status: String = ""
        
        if ((weekday >= 2 && weekday <= 6 && hour >= 7 && hour <= 19) && (minute <= 59))
        {
            status = "Open"
        }
        else
        {
            status = "Closed"
        }
        return status
    }
    
    //When I click on the row, magic happens)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        switch indexPath.row {
            
        case 0:
            self.pushViewController(withIdentifier: "Lot5TableViewController")
        case 1:
            self.pushViewController(withIdentifier: "BrandywineTableViewController")
        case 2:
            self.pushViewController(withIdentifier: "PippinTableViewController")
        default:
            break

        }
    }

    @IBAction func RetailButton(_ sender: UIButton) {
        self.presentViewControllerWithNavBar(identifier: "SecondViewController", animated: false)
    }
    
    @IBAction func mapButton(_ sender: UIButton) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        self.present(next, animated: false, completion: nil)
        
    }
}

