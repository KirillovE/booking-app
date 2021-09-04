//
//  SettingsViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        title = "Setting"
        
        let tabImage: UIImage?
        if #available(iOS 13.0, *) {
            tabImage = UIImage(systemName: "gearshape.fill")
        } else {
            tabImage = UIImage(named: "settings")
        }
        let tabItem = UITabBarItem(title: title, image: tabImage, selectedImage: nil)
        tabBarItem = tabItem
    }
}
