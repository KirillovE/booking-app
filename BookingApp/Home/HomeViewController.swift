//
//  ViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        
        let tabImage: UIImage?
        if #available(iOS 13.0, *) {
            tabImage = UIImage(systemName: "house.fill")
        } else {
            tabImage = UIImage(named: "home")
        }
        let tabItem = UITabBarItem(title: title, image: tabImage, selectedImage: nil)
        tabBarItem = tabItem
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let client = Client()
        let booking = client.getBookings(25).first
        self.view.backgroundColor = booking?.status.color
    }
}

