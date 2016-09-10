//
//  MapController.swift
//  Expl0r
//
//  Created by Linda Xia on 9/10/16.
//  Copyright © 2016 CMU. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var currentVenue = VenueStruct()

class MapController: UIViewController, VenueAPIDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    var initialLocation = CLLocation(latitude: 39.952073, longitude: -75.205591)
    
    func didReceive(venues: [VenueStruct]) -> Void {
        currentVenue = venues[Int(arc4random_uniform(UInt32(venues.count)))]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let geocoder = CLGeocoder()
        let foursquareAPI = VenueAPI(currDelegate: self)
        let address = inputtedAddress
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
            if((error) != nil) {
                print("error",error)
            }
            if let placemark = placemarks?.first {
                let coordinates = placemark.location!.coordinate
                let currLatitude = coordinates.latitude
                let currLongitude = coordinates.longitude
                let location = CLLocation(latitude: currLatitude, longitude: currLongitude)
                self.centerMapAtLocation(location)
                foursquareAPI.getChosenVenue(location, queryType: "Coffee")
                
            }
        })
        //let cathy = Artwork(title: "Cathedral of Learning", discipline: "church", coordinate: CLLocationCoordinate2D(latitude: 40.444247, longitude: -79.953338))
        //mapView.addAnnotation(cathy)
        
      
    }
    let regionRadius: Double = 1000
    func centerMapAtLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    




}
