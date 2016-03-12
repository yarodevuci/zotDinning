//
//  SecondViewController.swift
//  zotDinning
//
//  Created by Yaro on 11/26/15.
//  Copyright © 2015 Yaro. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate, UISearchResultsUpdating {
    
    
    
    @IBOutlet weak var RetailButton: UIButton!
    
    
    @IBOutlet weak var TabBar: UITabBarItem!
        
    @IBOutlet weak var RetailTableView: UITableView!  //our TableView
    var resultSearch = UISearchController() //our UISearchbar
    //============================================================================================================//
    
    //Populating our tableview with labels and images
    var menuItems = [(name: "20/20 Cafe", image: "20_20Cafe.jpg"),
                     (name: "Au Bon Pain", image: "AuBonPain.jpg"),
                     (name: "BC's Cavern", image: "BCsCavern.jpg"),
                     (name: "C3 Express", image: "C3Express.jpg"),
                     (name: "Cafe Med", image: "CafeMed.jpg"),
                     (name: "Cyber A Cafe", image: "CyberA.jpg"),
                     (name: "Espress Yourself", image: "EspressYourself.jpg"),
                     (name: "Gottschalk P.O.D.", image: "Gottschalk.jpg"),
                     (name: "Java City Kiosk", image: "JavaCity.jpg"),
                     (name: "Med Ed Cafe", image: "MedEdCafe.jpg"),
                     (name: "Phoenix Food", image: "PheonixFoodCt.jpg"),
                     (name: "Jamba Juice", image: "JambaJuice.jpg"),
                     (name: "Panda Express", image: "PandaExpress.jpg"),
                     (name: "Subway", image: "Subway.jpg"),
                     (name: "Anthill Pub & Grill", image: "AnthillPub&Grill.jpg")]
    
    var cafeInfo = [(hours: "Monday - Friday: 7:30 am - 4:00 pm \nSaturday & Sunday: Closed",
               description: "Located inside the Hebert Gavin Eye Institute, the 20/20 Cafe is a We Proudly Serve Starbucks that offers a variety of beverages and pastries. ",
                 address: "850 Health Sciences Rd,\nIrvine, CA 91710", phoneNumber: "(949) 824-1911", email: "walker-jayda@aramark.com"),
        (hours: "Monday - Thursday: 7:30 am - 9:00 pm \nFriday: 7:30 am - 5:00 pm \nSaturday: 7:30 am - 3:00 pm \nSunday: Closed ", description: "Located in the Paul Merage School of Business, Au Bon Pain is a fast-casual bakery and café chain specializing in breakfast, hot and cold sandwiches, wraps, salads, soups and pastries. Whether you are looking to eat better or treat yourself, we've got a seasonal menu of cravebale options.", address: "Paul Merage School of Business \nIrvine, CA 92697", phoneNumber: "(949) 824-0492", email: "Patel-Pannabahen@aramark.com"),
        (hours: "Monday - Thursday: 7:30 am - 8:00 pm \nFriday: 7:30 am - 5:00 pm \nSaturday & Sunday: Closed", description: "Located in between Steinhaus Hall and Schneiderman Lecture Hall, BC's Cavern overlooks the beautiful Aldrich Park and is a perfect place enjoy a delicious hot meal while studying or grab a fresh sandwich from subway while on your way to class.", address: "501 Mesa Road \nIrvine, CA 92697", phoneNumber: "(949) 824-2195", email: "parman-jennifer@aramark.com"),
        (hours: "Monday - Thursday: 7:30 am - 9:00 pm \nFriday: 7:30 am - 5:00 pm \nSaturday & Sunday: Closed", description: "C3 Express offers fast, affordable convenience and a great variety of items ready to satisfy you. Whether you’re looking for a quick snack to take with you, something more filling, or even something to energize you through a long night of work or studying.", address: "211 Social Science Plaza \nIrvine, CA 92697", phoneNumber: "(949) 824-0658", email: "lascano-veronica@aramark.com"),
        (hours: "Monday - Friday: 8:00 am - 3:00 pm \nSaturday & Sunday: Closed", description: "Located between Medical Surge I & II and academy way, Cafe Med provides convenience items such as fresh and healthy grab and go sandwiches, salads, hot meals, sweet and salty snacks, bottled beverages and much more! Its quiet patio affords a nice place to study and enjoy your lunch.", address: "800 Academy Way \nIrvine, CA 92697", phoneNumber: "(949) 824-2190", email: "Ramirez-Sarai@aramark.com"),
        
        (hours: "Monday - Thursday: 7:30 am - 7:00 pm \nFriday: 7:30 am - 4:00 pm \nSaturday & Sunday: Closed ",
            description: "Cyber A Café carries proudly serves Java City Ecogrounds beverages, an assortment of tasty pastries and a number of hearty and healthy food options, such as sandwiches and wraps. Cyber A Café sits cozily in the heart of the School of the Arts.", address: "712 West Peltason \nIrvine, CA 92697", phoneNumber: "(949) 824-9848", email: "ramirez-natalia1@aramark.com"),
        (hours: "Monday - Friday: 7:30 am - 4:00 pm \nSaturday & Sunday: Closed", description: "Espress Yourself coffee cart, nestled in-between the School of Law and Education, offers espresso-crafted Java city beverages, fresh pastries and grab and go snacks. ", address: "531 East Peltason Drive \nIrvine, CA 92697", phoneNumber: "(949) 824-2523", email: "Poonpipat-Joe@aramark.com"),
        (hours: "Monday - Friday: 8:00 am - 4:00 pm \nSaturday & Sunday: Closed", description: "Located in the Gottschalk Medical Plaza, P.O.D. Express serves freshly brewed coffee and light grab n go snacks.", address: "531 East Peltason Drive \nIrvine, CA 92697", phoneNumber: "(949) 824-2523", email: "lascano-veronica@aramark.com"),
        (hours: "Monday - Thursday: 7:30 am - 9:00 pm \nFriday: 7:30 am - 5:00 pm \nSaturday & Sunday: Closed", description: "Java City is a microcosm of urban coffee excellence. With some of the freshest coffees on the planet, an ample espresso bar menu, and approachable Javanistas ready to share their knowledge, we at Java City strive to be your metropolitan oasis of refreshment.", address: "308 Engineering Quad \nIrvine, CA 92697", phoneNumber: "(949) 824-5779", email: "synak-evelyn@aramark.com"),
        (hours: "Monday - Friday: 7:30 am - 5:00 pm \nSaturday & Sunday: Closed", description: "Med Ed Café proudly serves Starbucks coffee. Create your own hand-crafted beverage or try one of our recommendations! Med Ed Café also offers an assortment of pastries and grab and go items to satisfy your every craving. ", address: "1200 A Medical Education Bldg \nIrvine, CA 92697", phoneNumber: "(949) 824-5967", email: "walker-jayda@aramark.com"),
        (hours: "Monday - Thursday: 7:30 am - 8:00 pm \nFriday: 7:30 am - 5:00 pm \nSaturday & Sunday: Closed", description: "Phoenix Food Court offers a variety of concepts including Greens to Go, Tortilla Fresca's, Grille Works' and Einstein’s Bros. Bagels with a great view of Aldrich Park and ample seating. ", address: "204 Social Science Plaza \nIrvine, CA 92697", phoneNumber: "(949) 824-7190", email: "parman-jennifer@aramark.com"),
        (hours: "Monday - Thursday: 7:30 am - 8:00 pm \nFriday: 7:30 am - 5:00 pm \nSaturday & Sunday: Closed", description: "Jamba Juice specializes in blended fruit drinks, including our signature line of smoothies and other health conscious snacks.", address: "Student Center (East Food Court)", phoneNumber: "(949) 824-1170", email: "kuehnert-kelly@aramark.com"),
        (hours: "Monday - Thursday: 10:30 am - 8:00 pm \nFriday: 10:30 am - 6:00 pm \nSaturday & Sunday: Closed", description: "Panda Express features Mandarin and Szechwan wok-cooked entrées, and sides for lunch and dinner. Favorites are beef with broccoli, orange chicken and kung pao chicken. Several sides to choose from, and don’t forget a dessert, even if it’s only a fortune cookie.", address: "Student Center (West Food Court)", phoneNumber: "(949) 824-0659", email: "kuehnert-kelly@aramark.com"),
        (hours: "Monday - Thursday: 7:30 am - 10:00 pm \nFriday: 7:30 am - 8:00 pm \nSaturday & Sunday: 11:00 am - 7:00 pm", description: "Subway is the undisputed leader in providing you with choices, including many healthier meal options. Fast, fresh and healthy. ", address: "Student Center (West Food Court)", phoneNumber: "(949) 824-2197", email: "kuehnert-kelly@aramark.com"),
        (hours: "Monday: 11:00 am - 11:00 pm \nTuesday & Wednesday: 11:00am - 12:00pm \nThursday & Friday: 11:00 am - 1:00 am \nSaturday: 7:00 pm - 1:00 am \nSunday: Closed", description: "Located on the Student Center Terrace, the Anthill Pub & Grille features craft beers, wine and a great pub menu! ", address: "Student Center (Next to East Food Court", phoneNumber: "(949) 824-3050", email: "kuehnert-kelly@aramark.com")
        
    ]
    
    var menuItemsFiltered: [(name: String, image: String)] = []
    
    //Populate info of cafe hours (same order :
    
    
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if self.resultSearch.active
        {
            return self.menuItemsFiltered.count
        }
        else
        {
            return self.menuItems.count
        }
    }
    
    //Display info in our Residential cells
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("RetailCell", forIndexPath: indexPath) as! ResidentialTableViewCell
        
                if self.resultSearch.active
                {
                    cell.RetailLabel.text = menuItemsFiltered[indexPath.row].name
                    cell.RetailImage.image = UIImage(named: menuItemsFiltered[indexPath.row].image)
                }
                else
                {
                    cell.RetailImage.image = UIImage(named: menuItems[indexPath.row].image)
                    cell.RetailLabel.text = menuItems[indexPath.row].name
                }
          return cell
    }
    
    var selectedDLabel: String?
    var retailImages: UIImage?
    
    var hoursCafe: String?
    var descriptionCafe: String?
    var addressCafe: String?
    var phoneNumber: String?
    var emailCafe: String?
    
    //When I click on the row, magic happens)
    internal func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if resultSearch.active
        {
            selectedDLabel = self.menuItemsFiltered[indexPath.row].name
            retailImages = UIImage(named: menuItemsFiltered[indexPath.row].image)
            
            hoursCafe = self.cafeInfo[indexPath.row].hours
            descriptionCafe = self.cafeInfo[indexPath.row].description
            addressCafe = self.cafeInfo[indexPath.row].address
            phoneNumber = self.cafeInfo[indexPath.row].phoneNumber
            emailCafe = self.cafeInfo[indexPath.row].email

            performSegueWithIdentifier("transfer", sender: self)

        }
        
       selectedDLabel = self.menuItems[indexPath.row].name
       retailImages = UIImage(named: menuItems[indexPath.row].image)
        
       hoursCafe = self.cafeInfo[indexPath.row].hours
       descriptionCafe = self.cafeInfo[indexPath.row].description
       addressCafe = self.cafeInfo[indexPath.row].address
       phoneNumber = self.cafeInfo[indexPath.row].phoneNumber
       emailCafe = self.cafeInfo[indexPath.row].email

        
     performSegueWithIdentifier("transfer", sender: self)
        
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "transfer")
        
        {
            let vc = segue.destinationViewController as! RetailDisplay
            vc.titleName = selectedDLabel!
            vc.retImage = retailImages!
            vc.hours = hoursCafe!
            vc.descriptionF = descriptionCafe!
            vc.address = addressCafe!
            vc.phoneNum = phoneNumber!
            vc.email = emailCafe!
        }
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        self.menuItemsFiltered.removeAll(keepCapacity: false)
        let searchText = searchController.searchBar.text!.lowercaseString
        menuItemsFiltered = menuItems.filter {($0.name as NSString).localizedCaseInsensitiveContainsString("\(searchText)")}
        RetailTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RetailButton.enabled = false
        
        //Properties of our searchbar
        self.resultSearch = UISearchController(searchResultsController: nil)
        self.resultSearch.searchResultsUpdater = self
        self.resultSearch.dimsBackgroundDuringPresentation = false
        self.resultSearch.searchBar.sizeToFit()
        self.RetailTableView.tableHeaderView = self.resultSearch.searchBar
        self.RetailTableView.reloadData()
        
        //hides the search bar in the beginning
        self.RetailTableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: false)
        
        definesPresentationContext = true

    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    @IBAction func residentialButton(sender: UIButton) {
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("FirstViewController") as! FirstViewController
        self.presentViewController(next, animated: false, completion: nil)
    }
    
    @IBAction func mapButton(sender: UIButton) {
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("MapViewController") as! MapViewController
        self.presentViewController(next, animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
