//
//  AppDelegate.swift
//  emergencycallapp
//
//  Created by Axiom HK 13 on 01/05/2018.
//  Copyright © 2018 Axiom HK 13. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Firebase
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
var number=String()
    var longitude=0.0
    var status = 0
    var latitude=0.0
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
    GMSServices.provideAPIKey("AIzaSyBnZaIJeW-B0ufLBIdmoUJNnxXlVF7blvI")
        FirebaseApp.configure()
       IQKeyboardManager.shared.enable = true
        Auth.auth().addStateDidChangeListener { (auth, user) in
        
            if let user = user {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                // instantiate your desired ViewController
                let rootController = storyboard.instantiateViewController(withIdentifier: "home") as! ViewController
                // Because self.window is an optional you should check it's value first and assign your rootViewController
                if let window = self.window {
                    window.rootViewController = rootController
                    
                }
            
            
        }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

