//
//  ViewController.swift
//  emergencycallapp
//
//  Created by Axiom HK 13 on 01/05/2018.
//  Copyright © 2018 Axiom HK 13. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class ViewController: UIViewController , CLLocationManagerDelegate{
var locationManager = CLLocationManager()
    var longitude=151.20
    var latitude = -33.86

    var counter=0
    @IBOutlet weak var MV: UIView!
  
    override func viewDidAppear(_ animated: Bool) {
      print("View Did Appear")
         emergencybutton.isHidden=false
        
    }
     let emergencybutton=CustomButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
         print("View Did Load")
     determineMyCurrentLocation()
        // Do any additional setup after loading the view, typically from a nib.
      emergencybutton.isHidden=false
        //determineMyCurrentLocation()
       
        
    
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="2ndscreen"{
        
            
        }
    
    }
    
   
    @objc func buttonClicked(sender: UIButton){
       sender.isHidden=true

        self.performSegue(withIdentifier: "2ndscreen", sender: nil)
        
    }
    
    @objc func menubuttonClicked(sender: UIButton){
        sender.isHidden=true
        
        self.performSegue(withIdentifier: "sidemenu", sender: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        
        // manager.stopUpdatingLocation()
        self.latitude=userLocation.coordinate.latitude
        self.longitude=userLocation.coordinate.longitude
        appdelegate.latitude=self.latitude
        appdelegate.longitude=self.longitude
        if(!(counter==1)){
        let camera = GMSCameraPosition.camera(withLatitude:  self.latitude  , longitude: self.longitude, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        let h=view.frame.height
        let w=view.frame.width
        view = (mapView)
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude:  self.latitude, longitude: self.longitude)
        
        marker.map = mapView
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        emergencybutton.frame = CGRect(x: w*0.075, y: h*0.8, width: w*0.85, height: 50)
        emergencybutton.setTitle("EMERGENCY CALL",  for: UIControlState.normal)
        emergencybutton.addTarget(self, action:#selector(self.buttonClicked(sender:)),    for: .touchUpInside)
        emergencybutton.backgroundColor=UIColor.red
        emergencybutton.setTitleColor(UIColor.white, for: .normal)
        emergencybutton.cornerRadius=7
        emergencybutton.titleLabel?.font=UIFont(name: "Arial", size: 22)
        emergencybutton.isHidden=false
        
        let menubutton = UIButton(type: .system)
        menubutton.frame=CGRect(x: w*0.74, y: h*0.08, width: 61, height: 38)
        menubutton.setImage(UIImage(named: "Image"), for: .normal)
        menubutton.tintColor=UIColor.black
           menubutton.addTarget(self, action:#selector(self.menubuttonClicked(sender:)),    for: .touchUpInside)
        self.view.addSubview(menubutton)
        self.view.addSubview(emergencybutton)
            counter=1
    }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    @IBOutlet weak var EmergencyButton: CustomButton!
    @IBAction func EmergencyButtonPressed(_ sender: Any) {
        EmergencyButton.isHidden=true
        self.performSegue(withIdentifier: "Segue1", sender: nil)
    }
}

