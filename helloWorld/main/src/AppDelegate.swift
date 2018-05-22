//
//  AppDelegate.swift
//  helloWorld
//
//  Created by Victor Bolinches Marin on 17/05/2018.
//  Copyright © 2018 Victor Bolinches Marin. All rights reserved.
//

import UIKit
import KotlinNativeFramework


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var kotlinFwk : KNFKotlinNativeFramework = KNFKotlinNativeFramework()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        kotlinFwk.printAsync(str : "application : \(application)")
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
        kotlinFwk.printAsync(str : "applicationWillResignActive : \(application)")
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
       kotlinFwk.printAsync(str : "applicationDidEnterBackground : \(application)")
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        kotlinFwk.printAsync(str : "applicationWillEnterForeground : \(application)")
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        kotlinFwk.printAsync(str : "applicationDidBecomeActive : \(application)")
    }
    func applicationWillTerminate(_ application: UIApplication) {
        kotlinFwk.printAsync(str : "applicationWillTerminate : \(application)")
    }
}
