//
//  BooingDetailTableViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

final class BookingDetailViewController: UIViewController {
    
    private var booking: Booking?
    
    init(booking: Booking?) {
        self.booking = booking
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
}

// MARK: - Private methods

private extension BookingDetailViewController {
    
    func initialSetup() {
        title = "Booking"
        navigationController?.navigationBar.prefersLargeTitles = true
        setLabel()
        
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        if
            let splitController = splitViewController,
            let navController = splitController.viewControllers.last as? UINavigationController,
            UIDevice.current.userInterfaceIdiom != .phone {
            navController.topViewController?.navigationItem.leftBarButtonItem = splitController.displayModeButtonItem
        }
    }
    
    func setLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        label.center = view.center
        label.textColor = booking?.status.color
        label.text = booking?.user.firstName ?? "Pick a booking"
        view.addSubview(label)
    }
    
}
