//
//  ViewController.swift
//  HonoluluArt
//
//  Created by kpugame on 2017. 4. 19..
//  Copyright © 2017년 Jae Won Yoo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var artworks = [Artwork]()
    
    func loadInitialData(){
        
        let fileName = Bundle.main.path(forResource: "PublicArt", ofType: "json")
        var data: Data?
        do{
            data = try Data(contentsOf: URL(fileURLWithPath: fileName!), options: NSData.ReadingOptions(rawValue: 0))
        } catch _ {
            data = nil
        }
        
        var jsonObject: Any? = nil
        if let data = data{
            do{
                jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0))
            } catch _ {
                jsonObject = nil
            }
        }
        
        if let jsonObject = jsonObject as? [String: Any], let jsonData = JSONValue.fromObject(object: jsonObject as AnyObject)?["data"]?.array{
            for artworkJSON in jsonData{
                if let artworkJSON = artworkJSON.array,
                
                    let artwork = Artwork.fromJSON(json: artworkJSON){
                    artworks.append(artwork)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: 21.28778, longitude: -157.829444)
        
        centerMapOnLocation(location: initialLocation)
        mapView.delegate = self
        let artwork = Artwork(title: "King David Kalakaua", locationName: "Waikiki Gateway Park", discipline: "Sculpture", coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
        mapView.addAnnotation(artwork)
        loadInitialData()
        mapView.addAnnotations(artworks)
    }
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(location : CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
   
}

