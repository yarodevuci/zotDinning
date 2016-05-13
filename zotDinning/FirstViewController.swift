//
//  FirstViewController.swift
//  zotDinning
//
//  Created by Yaro on 11/26/15.
//  Copyright © 2015 Yaro. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate
    {
    
    @IBOutlet weak var myButton: UIButton!
    var ResidentialPlacesArray = ["Lot 5", "Brandywine", "Pippin"]
    var ResidentialImagesArray = ["Lot5.jpg", "Brandywine.jpg", "Pippin.jpg"]
    
    weak var ResTableView: UITableView!
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ResidentialImagesArray.count
    }
    
    //Display info in our Residential cells
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ResidentialTableViewCell
        let entry = ResidentialPlacesArray[indexPath.row]
        let image = UIImage(named: ResidentialImagesArray[indexPath.row])
        cell.backgroundImage.image = image
        cell.headingLabel.text = entry

        switch indexPath.row
        {
        case 0:
            cell.openStatus.text = displayStatusforLot5()
            if displayStatusforLot5() == "Open"
            {
                cell.openStatus.textColor = UIColor.greenColor()
            }
        case 1:
            cell.openStatus.text = displayStatusForBrandywine()
            if displayStatusForBrandywine() == "Open"
            {
                cell.openStatus.textColor = UIColor.greenColor()
            }
        case 2:
            cell.openStatus.text = displayStatusforLot5()
            if displayStatusforLot5() == "Open"
            {
                cell.openStatus.textColor = UIColor.greenColor()
            }
        default:
            break
        }
        
        return cell
    }
    
    func displayStatusForBrandywine () -> String
    {
        let dateTimeComponents = ResidentialTableViewCell().getCallendarInfo()
        var status: String = ""

        if ((dateTimeComponents.weekday >= 2 && dateTimeComponents.weekday <= 5) && (dateTimeComponents.hour >= 10 && dateTimeComponents.hour <= 23) && (dateTimeComponents.minute <= 59 && dateTimeComponents.hour != 0) || ((dateTimeComponents.weekday == 6 && dateTimeComponents.hour >= 10 && dateTimeComponents.minute >= 30 && dateTimeComponents.hour <= 21) || (dateTimeComponents.weekday == 6 && dateTimeComponents.hour >= 11 && (dateTimeComponents.hour <= 21 && dateTimeComponents.minute < 0))))
        {
            status = "Open"
        }
        else
        {
            status = "Closed"
        }
        return status
    }
    
    func displayStatusforLot5 () ->String {
        
        let dateTimeComponents = ResidentialTableViewCell().getCallendarInfo()
        var status: String = ""
        
        if ((dateTimeComponents.weekday >= 2 && dateTimeComponents.weekday <= 6 && dateTimeComponents.hour >= 7 && dateTimeComponents.hour <= 19) && (dateTimeComponents.minute <= 59))
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
    internal func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
       let shortPath = (indexPath.row)
        
        switch shortPath {
            
        case 0:
            let next = self.storyboard?.instantiateViewControllerWithIdentifier("Lot5ViewController") as! Lot5ViewController
            self.presentViewController(next, animated: true, completion: nil)
        case 1:
            let nextRes = self.storyboard?.instantiateViewControllerWithIdentifier("BrandywineViewController") as! BrandywineViewController
            self.presentViewController(nextRes, animated: true, completion: nil)

        case 2: 
            let nextPippin = self.storyboard?.instantiateViewControllerWithIdentifier("PippinViewController") as! PippinViewController
            self.presentViewController(nextPippin, animated: true, completion: nil)
            
        default: break
            
        }
        
    }
    
//    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
//        
//        let selectedTag: Int = (tabBar.selectedItem?.tag)!
//        
//        switch selectedTag
//        {
//        case 1:
//            let next = self.storyboard?.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
//            self.presentViewController(next, animated: true, completion: nil)
//        case 2:
//            let next = self.storyboard?.instantiateViewControllerWithIdentifier("MapViewController") as! MapViewController
//            self.presentViewController(next, animated: true, completion: nil)
//            
//        default:
//            break
//            
//        }
//    }

    @IBAction func RetailButton(sender: UIButton) {
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
            self.presentViewController(next, animated: false, completion: nil)
    }
    
    @IBAction func mapButton(sender: UIButton) {
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("MapViewController") as! MapViewController
        self.presentViewController(next, animated: false, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.enabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

