//
//  SettingsViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
}

// MARK: - Private methods

private extension SettingsViewController {
    
    func initialSetup() {
        view.backgroundColor = .green
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(named: "settings"),
            selectedImage: nil
        )
    }
    
}
