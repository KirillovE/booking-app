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
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = getConfiguredTabBarController()
        return true
    }
    
}

// MARK: - UISplitViewControllerDelegate

extension AppDelegate: UISplitViewControllerDelegate {
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController
    ) -> Bool {
        true
    }
    
}

// MARK: - Configuring root controller

private extension AppDelegate {
    
    func getConfiguredTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            getConfiguredHomeController(),
            getConfiguredSplitController(),
            getConfiguredSettingsController()
        ]
        tabBarController.selectedIndex = 0
        return tabBarController
    }
    
    func getConfiguredHomeController() -> UIViewController {
        let homeController = HomeViewController()
        return UINavigationController(rootViewController: homeController)
    }
    
    func getConfiguredSplitController() -> UISplitViewController {
        let splitController = UISplitViewController()
        splitController.delegate = self
        
        splitController.tabBarItem = .init(
            title: "Bookings",
            image: UIImage(named: "book"),
            tag: 1
        )
        
        splitController.viewControllers = [
            UINavigationController(rootViewController: BookingTableViewController()),
            UINavigationController(rootViewController: BookingDetailViewController(booking: nil))
        ]
        return splitController
    }
    
    func getConfiguredSettingsController() -> UIViewController {
        let settingsController = SettingsViewController()
        return UINavigationController(rootViewController: settingsController)
    }
    
}
