//
//  MapViewController.swift
//  zotDinning
//
//  Created by Yaro on 12/3/15.
//  Copyright © 2015 Yaro. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var Map: MKMapView!
    @IBOutlet weak var TabBar: UITabBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapButton.isEnabled = false
        //Lot 5 Location
        let UCILocation = CLLocationCoordinate2DMake(33.645582, -117.842500)
        let Lot5Location = CLLocationCoordinate2DMake(33.651009, -117.845364) //Lot 5 Residential
        let BrandywineLocation = CLLocationCoordinate2DMake(33.6456527709961, -117.839050292969)
        let PippinLocation = CLLocationCoordinate2DMake(33.6446151733398, -117.836807250977)
        
        let Cafe20_20 = CLLocationCoordinate2DMake(33.6422309875488, -117.851112365723) //20/20Cafe
        let AuBonPain = CLLocationCoordinate2DMake(33.646907, -117.837917)
        let BCsCavern = CLLocationCoordinate2DMake(33.6458778381348, -117.844505310059)
        let C3Express = CLLocationCoordinate2DMake(33.6468887329102, -117.83960723877)
        let CafeMed = CLLocationCoordinate2DMake(33.645992, -117.849115)
        let CyberA_Cafe = CLLocationCoordinate2DMake(33.6499366760254, -117.844306945801)
        let Gottschalk = CLLocationCoordinate2DMake(33.6471138000488, -117.851089477539)
        
        let GottschalkAnno = MKPointAnnotation()
        let CyberA_CefeAnnotation = MKPointAnnotation()
        let CafeMedAnno = MKPointAnnotation()
        let C3ExpAnnotation = MKPointAnnotation()
        let Lot5Annotation = MKPointAnnotation() //Lot5
        let BrandyAnnotation = MKPointAnnotation()  //Brandywine
        let PippinAnnotation = MKPointAnnotation() //Pippin
        
        let Cafe20Annotation = MKPointAnnotation() //2020Cafe
        let AuBonPainAnnotation = MKPointAnnotation()
        let BCsCavernAnnotation = MKPointAnnotation()
        
        //Center the map in UCI Area
        let span = MKCoordinateSpanMake(0.02, 0.02)
        let region = MKCoordinateRegion(center: UCILocation, span: span)
        Map.setRegion(region, animated: true)
        
        GottschalkAnno.coordinate = Gottschalk
        GottschalkAnno.title = "Gottschalk P.O.D."
        GottschalkAnno.subtitle = "Retail"
        CyberA_CefeAnnotation.coordinate = CyberA_Cafe
        CyberA_CefeAnnotation.title = "Cyber A Cafe"
        CyberA_CefeAnnotation.subtitle = "Retail"
        CafeMedAnno.coordinate = CafeMed
        CafeMedAnno.title = "Cafe Med"
        CafeMedAnno.subtitle = "Retail"
        C3ExpAnnotation.coordinate = C3Express
        C3ExpAnnotation.title = "C3 Express"
        C3ExpAnnotation.subtitle = "Retail"
        
        BCsCavernAnnotation.coordinate = BCsCavern
        BCsCavernAnnotation.title = "BC's Cavern"
        BCsCavernAnnotation.subtitle = "Retail"
      
        Lot5Annotation.coordinate = Lot5Location
        BrandyAnnotation.coordinate = BrandywineLocation
        PippinAnnotation.coordinate = PippinLocation
        
        Cafe20Annotation.coordinate = Cafe20_20
        AuBonPainAnnotation.coordinate = AuBonPain
        
        Lot5Annotation.title = "Lot 5 Commons"
        Lot5Annotation.subtitle = "Residential"
        
        BrandyAnnotation.title = "Brandywine Commons"
        BrandyAnnotation.subtitle = "Residential"
        
        PippinAnnotation.title = "Pippin Commons"
        PippinAnnotation.subtitle = "Residential"
        
        Cafe20Annotation.title = "20/20 Cafe"
        Cafe20Annotation.subtitle = "Retail"
        
        AuBonPainAnnotation.title = "Au Bon Pain"
        AuBonPainAnnotation.subtitle = "Retail"
        
        Map.addAnnotation(Lot5Annotation)
        Map.addAnnotation(BrandyAnnotation)
        Map.addAnnotation(PippinAnnotation)
        
        Map.addAnnotation(Cafe20Annotation)
        Map.addAnnotation(AuBonPainAnnotation)
        Map.addAnnotation(BCsCavernAnnotation)
        Map.addAnnotation(C3ExpAnnotation)
        Map.addAnnotation(CafeMedAnno)
        Map.addAnnotation(CyberA_CefeAnnotation)
        Map.addAnnotation(GottschalkAnno)
        
    }
    
    @IBOutlet weak var mapButton: UIButton!
    
    @IBAction func residentialButton(_ sender: UIButton) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        self.present(next, animated: false, completion: nil)
    }
    
    @IBAction func retailButton(_ sender: UIButton) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.present(next, animated: false, completion: nil)
    }
    
    
    
//    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
//        
//        let selectedTag: Int = (tabBar.selectedItem?.tag)!
//        
//        switch selectedTag
//        {
//        case 0:
//            let next = self.storyboard?.instantiateViewControllerWithIdentifier("FirstViewController") as! FirstViewController
//            self.presentViewController(next, animated: true, completion: nil)
//        case 1:
//            let next = self.storyboard?.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
//            self.presentViewController(next, animated: true, completion: nil)
//            
//        default:
//            break
//            
//        }
//    }
//

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
