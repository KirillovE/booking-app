//
//  BookingsViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

final class BookingTableViewController: UITableViewController {
    
    private var bookings = [Booking]()
    private lazy var interactor: BookingListInteractor = {
        var interactor = BookingListInteractor()
        interactor.bookingsRepresenter = self
        interactor.errorRepresenter = self
        return interactor
    }()
    
    init() {
        if #available(iOS 13.0, *) {
            super.init(style: .insetGrouped)
        } else {
            super.init(style: .grouped)
        }
        interactor.loadUsers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
}

// MARK: - UITableViewDataSource

extension BookingTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let booking = self.bookings[indexPath.row]
        cell.textLabel?.text = "\(booking.user.shortName) — \(booking.status)"
        cell.backgroundColor = booking.status.color
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension BookingTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let booking = bookings[indexPath.row]
        let detailViewController = BookingDetailViewController(booking: booking)
        detailViewController.statusObserver = self
        let detailNavigationController = UINavigationController(rootViewController: detailViewController)
        splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
    }
    
}

// MARK: - BookingListRepresenter

extension BookingTableViewController: BookingListRepresenter {
    
    func representBookings(_ bookings: [Booking]) {
        self.bookings = bookings
        DispatchQueue.main.async {
            self.tableView.reloadSections([0], with: .automatic)
        }
    }
    
}

// MARK: - ErrorRepresenter

extension BookingTableViewController: ErrorRepresenter {
    
    func representErrorText(_ error: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(
                title: NSLocalizedString("Error", comment: ""),
                message: error,
                preferredStyle: .alert
            )
            let closeTitle = NSLocalizedString("Close", comment: "")
            alertController.addAction(UIAlertAction(title: closeTitle, style: .cancel))
            self.present(alertController, animated: true)
        }
    }
    
}

// MARK: - StatusObserver

extension BookingTableViewController: StatusObserver {
    
    func handleNewStatus(_ newStatus: Status) {
        guard let selectedCellIndex = tableView.indexPathForSelectedRow else { return }
        bookings[selectedCellIndex.row].status = newStatus
        tableView.reloadRows(at: [selectedCellIndex], with: .automatic)
        if selectedCellIndex.row == 0 {
            notifyOfTopStatusChange(newStatus)
        }
    }
    
    private func notifyOfTopStatusChange(_ newStatus: Status) {
        let info = ["topStatus": newStatus]
        NotificationCenter.default.post(
            name: NotificationName.bookingsUpdated.name,
            object: nil,
            userInfo: info
        )
    }
    
}

// MARK: - Private methods

private extension BookingTableViewController {
    
    func initialSetup() {
        title = NSLocalizedString("Booking", comment: "")
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
}
