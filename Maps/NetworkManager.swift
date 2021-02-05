//
//  NetworkManager.swift
//  Maps
//
//  Created by user177578 on 2/1/21.
//  Copyright © 2021 alumnos. All rights reserved.
//

import Foundation
import MapKit
import Alamofire
import GoogleMaps

class NetworkManager: GoogleDirectionAPI{
    
    static var shared: NetworkManager = NetworkManager()
    
    func getRoute(origin: CLLocationCoordinate2D, destination: CLLocationCoordinate2D, completion: @escaping (GMSPolyline) -> Void) {
        
        let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json")
        
        
        var queryParameters = [
            "origin": origin.toString(),
            "destination": destination.toString(),
            "key": "AIzaSyDObYtXRXU9ZgWaOI_gMea_4nVtzJeonRw"] as [String : Any]
        
        AF.request(url as! URLConvertible, method: .get, parameters: queryParameters, encoding: URLEncoding(destination: .queryString), headers: nil).responseDecodable(of: Route.self){
            response in
        
            var path = GMSPath(fromEncodedPath: (response.value?.routes[0].overviewPolyline.points)!)
            
            completion(GMSPolyline(path: path))

        }
        
    }
    
    
}

protocol GoogleDirectionAPI {
    
    func getRoute(origin: CLLocationCoordinate2D, destination: CLLocationCoordinate2D, completion: @escaping (GMSPolyline)->Void)
    
}

extension CLLocationCoordinate2D{
    func toString() -> String{
        return "\(self.latitude), \(self.longitude)"
    }
}
