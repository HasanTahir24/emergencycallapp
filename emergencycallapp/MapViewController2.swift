//
//  MapViewController2.swift
//  emergencycallapp
//
//  Created by Hasan on 6/19/18.
//  Copyright © 2018 Axiom HK 13. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps
import Alamofire
import SwiftyJSON
import FirebaseDatabase
import GeoFire


class MapViewController2: UIViewController, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    let ref = Database.database().reference()
    var loc:[(Double,Double)]=[]
    var timer=Timer()
    var idx=0
    var distanceInMeters=0.0
    var totaldistance=0
    var totalduration=0
    
    @IBOutlet weak var callbutton: CustomButton!
    @IBOutlet weak var mapview: GMSMapView!
    let marker1 = GMSMarker()
  var appdelegate=UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        let geoFire = GeoFire(firebaseRef: self.ref)
        geoFire.setLocation(CLLocation(latitude: appdelegate.latitude  , longitude: appdelegate.longitude), forKey: "firebase-hq") { (error) in
            
        }
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude:  appdelegate.latitude , longitude: appdelegate.longitude)
        // Do any additional setup after loading the view.
        
        let camera = GMSCameraPosition.camera(withLatitude:  appdelegate.latitude  , longitude:appdelegate.longitude, zoom: 15.0)
        mapview.camera=camera
        mapview.animate(to: camera)
        
        marker.map=mapview
        
        marker1.position = CLLocationCoordinate2D(latitude: appdelegate.latitude+0.005 ,longitude: appdelegate.longitude+0.005)
        marker1.icon = imageWithImage(image:UIImage(named: "Red Ambulance")! , scaledToSize: CGSize(width: 50.0, height: 50.0))
        
        marker1.map = mapview
        
    }
var counter=0
    @IBAction func drawpolyline(_ sender: UIButton) {
        
if counter==0{
            sender.titleLabel?.text="Cancel"
           
            counter=1
            let origin = "\(appdelegate.latitude),\(appdelegate.longitude)"
        let destination = "\(appdelegate.latitude+0.005),\(appdelegate.longitude+0.005)"
        print(origin)
    print(destination)
        
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving"
        Alamofire.request(url).responseJSON {response in
            let json = try! JSON(data: response.data!)
        let routes=json["routes"].arrayValue
           print(routes)
            
            for route in routes
            {
                let routeOverviewPolyline = route["overview_polyline"].dictionary
                let points = routeOverviewPolyline?["points"]?.stringValue
                let path = GMSPath.init(fromEncodedPath: points!)
                let polyline = GMSPolyline.init(path: path)
                polyline.strokeWidth = 3
                polyline.strokeColor = UIColor.red
                polyline.map = self.mapview
                  let legs=route["legs"].arrayValue
                    for j in legs{
                        let steps=j["steps"].arrayValue
                        // print(steps)
                        for k in steps{
                            //print(k)
                            let distance=k["distance"].dictionaryValue
                            let duration=k["duration"].dictionaryValue
                            for l in distance{
                                if l.key=="value"
                                {
                                    // print(l.value.intValue)
                                    self.totaldistance += l.value.intValue
                                    //totaldistance=Int(l.value as! String)!
                                }
                            }
                            for l in duration{
                                if l.key=="value"
                                {
                                    // print(l.value.intValue)
                                    self.totalduration += l.value.intValue
                                    //totaldistance=Int(l.value as! String)!
                                }
                            }
                            
                        
                        
                        //    print(self.totaldistance)
                          //  print(self.totalduration)
                }
        
     
         
        }
            }
    }
    let coordinate0 = CLLocation(latitude: appdelegate.latitude, longitude: appdelegate.longitude)
    let coordinate1 = CLLocation(latitude: appdelegate.latitude+0.005, longitude: appdelegate.longitude+0.005)
    distanceInMeters = coordinate0.distance(from: coordinate1)
    
    
        }
  
    
        else{
      sender.titleLabel?.text="Call Driver"
            counter=0
        
        }
       
 
    self.timer = Timer.scheduledTimer(timeInterval:10, target: self, selector: #selector(self.senddetails), userInfo: nil, repeats: false)

    
   
    }
        @objc func senddetails(){
      ref.child("Calls").childByAutoId().setValue(["Patient Name":UserDefaults.standard.string(forKey: "username")!,"Contact":UserDefaults.standard.string(forKey: "contact")!,"Distance":totaldistance,"Time":totalduration])
             self.timer = Timer.scheduledTimer(timeInterval:1000, target: self, selector: #selector(self.timeToMoveOn), userInfo: nil, repeats: false)
    }
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    @objc func timeToMoveOn(){
        
//        marker1.position = CLLocationCoordinate2D(latitude: self.loc[idx].0 ,longitude: self.loc[idx].1)
//        idx+=1
//        print(marker1.position)
        self.performSegue(withIdentifier: "go on", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
