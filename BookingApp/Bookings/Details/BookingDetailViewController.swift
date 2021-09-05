//
//  BooingDetailTableViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

final class BookingDetailViewController: UIViewController {
    
    weak var statusObserver: StatusObserver?
    private var bookingTextLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
    private var booking: Booking? {
        didSet {
            setLabelText()
        }
    }
    
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

// MARK: - StatusObserver

extension BookingDetailViewController: StatusObserver {
    
    func handleNewStatus(_ newStatus: Status) {
        booking?.status = newStatus
        statusObserver?.handleNewStatus(newStatus)
    }
    
}

// MARK: - Private methods

private extension BookingDetailViewController {
    
    func initialSetup() {
        setNavigationItems()
        setLabelView()
        setLabelText()
        
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
    }
    
    func setNavigationItems() {
        navigationItem.title = NSLocalizedString("Booking", comment: "")
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if booking != nil {
            navigationItem.rightBarButtonItem = .init(
                barButtonSystemItem: .edit,
                target: self,
                action: #selector(editBooking)
            )
        }
        
        if
            let splitController = splitViewController,
            let navController = splitController.viewControllers.last as? UINavigationController,
            UIDevice.current.userInterfaceIdiom != .phone {
            navController.topViewController?.navigationItem.leftBarButtonItem = splitController.displayModeButtonItem
        }
    }
    
    func setLabelView() {
        bookingTextLabel.numberOfLines = 0
        bookingTextLabel.center = view.center
        view.addSubview(bookingTextLabel)
    }
    
    func setLabelText() {
        bookingTextLabel.textColor = booking?.status.color
        bookingTextLabel.text = booking.map(String.init) ?? NSLocalizedString("Pick a booking", comment: "")
    }
    
    @objc func editBooking() {
        let statusController = BookingStatusViewController()
        statusController.booking = booking
        statusController.statusObserver = self
        let navigationController = UINavigationController(rootViewController: statusController)
        present(navigationController, animated: true)
    }
    
}
