//
//  ViewController.swift
//  Maps
//
//  Created by alumnos on 25/01/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import GoogleMaps

class GoogleMapsViewController: UIViewController {
    
    let pointsOfInterest = [
        CLLocationCoordinate2D(latitude: 40.965, longitude: -5.6641),
        CLLocationCoordinate2D(latitude: 40.96069, longitude: -5.666),
        CLLocationCoordinate2D(latitude: 40.9616, longitude: -5.6676),
        CLLocationCoordinate2D(latitude: 40.947065110508476, longitude: -5.666232073013322)
    ]
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Center map
        let camera = GMSCameraPosition.camera(withLatitude: 40.965, longitude: -5.66305, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        
        
        // Markers
        let marker = GMSMarker()
        marker.position = pointsOfInterest[0]
        marker.title = "Plaza Mayor"
        marker.snippet = "Salamanca"
        marker.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = pointsOfInterest[1]
        marker2.title = "Catedral Nueva"
        marker2.snippet = "Salamanca"
        marker2.map = mapView
        
        let marker3 = GMSMarker()
        marker3.position = pointsOfInterest[2]
        marker3.title = "Universidad"
        marker3.snippet = "Salamanca"
        marker3.map = mapView
        
        let marker4 = GMSMarker()
        marker4.position = pointsOfInterest[3]
        marker4.title = "Estadio Reina Sofía"
        marker4.snippet = "Salamanca"
        marker4.map = mapView
        
        //Route
        /*let path = GMSMutablePath()
        path.add(pointsOfInterest[0])
        path.add(pointsOfInterest[1])
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 5.0
        polyline.geodesic = true
        polyline.map = mapView*/
        
        DispatchQueue.main.async{
            NetworkManager.shared.getRoute(origin: self.pointsOfInterest[0], destination: self.pointsOfInterest[3], completion: {route in
                route.strokeWidth = 5.0
                route.strokeColor = .cyan
                route.map = mapView
            } )
        }
    
        

    }
    
    
}

