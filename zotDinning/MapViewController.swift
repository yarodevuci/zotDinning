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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let UCILocation = CLLocationCoordinate2DMake(33.645582, -117.842500)
        
        createPinWithAnnotation(long: 33.6456527709961, latt: -117.839050292969, title: "Brandywine Commons")
        createPinWithAnnotation(long: 33.6446151733398, latt: -117.836807250977, title: "Pippin Commons")
        createPinWithAnnotation(long: 33.6422309875488, latt: -117.851112365723, title: "20/20 Cafe")
        createPinWithAnnotation(long: 33.646907, latt: -117.837917, title: "Au Bon Pain")
        createPinWithAnnotation(long: 33.6458778381348, latt: -117.844505310059, title: "BC's Cavern")
        createPinWithAnnotation(long: 33.6468887329102, latt: -117.83960723877, title: "C3Express")
        createPinWithAnnotation(long: 33.645992, latt: -117.849115, title: "CafeMed")
        createPinWithAnnotation(long: 33.6499366760254, latt: -117.844306945801, title: "Cyber A Cafe")
        createPinWithAnnotation(long: 33.6471138000488, latt: -117.851089477539, title: "Gottschalk")
        createPinWithAnnotation(long: 33.643453, latt: -117.841031, title: "Java City Kiosk")
        createPinWithAnnotation(long: 33.651204, latt: -117.845546, title: "The Anteatery")
        
        //Center the map in UCI Area
        let span = MKCoordinateSpanMake(0.02, 0.02)
        let region = MKCoordinateRegion(center: UCILocation, span: span)
        Map.mapType = .hybrid
        Map.setRegion(region, animated: true)
        
    }
    
    func createPinWithAnnotation(long: Double, latt: Double, title: String) {
        let location = CLLocationCoordinate2DMake(long, latt)
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = location
        dropPin.title = title
        Map.addAnnotation(dropPin)
    }
    
    @IBAction func didTapListIcon(_ sender: Any) {
        self.presentViewControllerWithNavBar(identifier: "ListTableViewController", animated: false)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
