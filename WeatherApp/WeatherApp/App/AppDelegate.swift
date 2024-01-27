//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Shameem on 27/1/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationConroller = UINavigationController(rootViewController: HomeViewController())
        window?.rootViewController = navigationConroller
        window?.makeKeyAndVisible()
        return true
    }

    


}

