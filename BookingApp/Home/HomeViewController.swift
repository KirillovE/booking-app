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
    
}

private extension HomeViewController {
    
    func initialSetup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Home"
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
    }
    
}
