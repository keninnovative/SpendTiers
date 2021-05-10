//
//  AppDelegate.swift
//  TrakerTest
//
//  Created by Ken Nyame on 5/4/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: UsersViewController())
        window?.makeKeyAndVisible()
        return true
    }

}

