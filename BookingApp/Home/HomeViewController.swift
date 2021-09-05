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
    private let notificationsCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        observeNotifications()
    }
    
}

// MARK: - Private methods

private extension HomeViewController {
    
    func initialSetup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = NSLocalizedString("Home", comment: "")
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
    }
    
    func observeNotifications() {
        notificationsCenter.addObserver(
            self,
            selector: #selector(updateColor),
            name: NotificationName.bookingsUpdated.name,
            object: nil
        )
    }
    
    @objc func updateColor(using notification: Notification) {
        guard
            let info = notification.userInfo as? [String: Status],
            let status = info["topStatus"]
        else { return }
        
        DispatchQueue.main.async {
            self.view.backgroundColor = status.color
        }
    }
    
}
