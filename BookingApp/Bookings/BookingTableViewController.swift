//
//  BookingsViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

class BookingTableViewController: UITableViewController {
    
    var bookings: [Booking] = []
    var client = Client()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .insetGrouped)
        }
        view.backgroundColor = .blue
        title = "Booking"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        bookings = client.getBookings(25)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookings.count
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let booking = self.bookings[indexPath.row]
        cell.textLabel?.text = booking.user.firstName
        return cell
     }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let booking = bookings[indexPath.row]
        let detailViewController = BookingDetailViewController(booking: booking)
        let detailNavigationController = UINavigationController(rootViewController: detailViewController)
        splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
    }
}
