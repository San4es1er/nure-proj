//
//  AppDelegate.swift
//  nure-proj
//
//  Created by Alex Lebedev on 13.06.2021.
//

import UIKit
import SnapKit
import Firebase
import FirebaseFirestore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        window = UIWindow()
        window?.rootViewController = DashboardVC()
        window?.makeKeyAndVisible()
        return true
    }

}

