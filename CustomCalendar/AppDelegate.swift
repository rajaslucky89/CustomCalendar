//
//  AppDelegate.swift
//  CustomCalendar
//
//  Created by raja syahmudin on 23/09/19.
//  Copyright © 2019 raja syahmudin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setRoutes()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

extension AppDelegate {
    private func setRoutes() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let initialViewController = CustomCalendar()
        let navi =  UINavigationController.init(rootViewController: initialViewController)
        self.window?.rootViewController = navi
        self.window?.makeKeyAndVisible()

    }
}
