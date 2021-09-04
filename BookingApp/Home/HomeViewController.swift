//
//  ViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let client = Client()
        let booking = client.getBookings(25).first
        self.view.backgroundColor = booking?.status.color
    }
    
}

private extension HomeViewController {
    
    func initialSetup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Home"
    }
    
}
