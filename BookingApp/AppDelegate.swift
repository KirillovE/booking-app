//
//  AppDelegate.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let splitController = UISplitViewController()
        splitController.viewControllers = [
            UINavigationController(rootViewController: BookingTableViewController()),
            UINavigationController(rootViewController: BookingDetailViewController(booking: nil))
        ]
        splitController.delegate = self
        let splitImage: UIImage?
        if #available(iOS 13.0, *) {
            splitImage = UIImage(systemName: "book.fill")
        } else {
            splitImage = UIImage(named: "book")
        }
        let splitControllerTabItem = UITabBarItem(title: "Bookings", image: splitImage, selectedImage: nil)
        splitController.tabBarItem = splitControllerTabItem
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            HomeViewController(),
            splitController,
            SettingViewController()
        ]

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarController
        
        return true
    }

}

extension AppDelegate: UISplitViewControllerDelegate {
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController
    ) -> Bool {
        true
    }
    
}
