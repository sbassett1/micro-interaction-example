//
//  AppDelegate.swift
//  Microinteractions
//
//  Created by Stephen Bassett on 5/21/19.
//  Copyright © 2019 Stephen Bassett. All rights reserved.
//

import UIKit

let tabBarDelegate = TabBarDelegate()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabController = UITabBarController()
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let firstVC = mainStoryboard.instantiateViewController(withIdentifier: "FirstVC") as! ViewController
        
        firstVC.view.backgroundColor = UIColor.red
        
        let secondVC = mainStoryboard.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        
        secondVC.view.backgroundColor = UIColor.yellow
        
        let vcData: [(UIViewController, UIImage, UIImage)] = [
            (firstVC, UIImage(named: "heart_icon")!, UIImage(named: "heart_selected_icon")!),
            (secondVC, UIImage(named: "heart_icon")!, UIImage(named: "heart_selected_icon")!)
        ]
        
        let vcs = vcData.map { (vc, defaultImage, selectedImage) -> UIViewController in
            
            vc.tabBarItem.image = defaultImage
            
            vc.tabBarItem.selectedImage = selectedImage
            
            return vc
            
        }
        
        tabController.viewControllers = vcs
        
        tabController.tabBar.isTranslucent = false
        
        tabController.delegate = tabBarDelegate
        
        window?.rootViewController = tabController
        
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

