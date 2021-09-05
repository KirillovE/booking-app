//
//  BookingListInteractor.swift
//  BookingApp
//
//  Created by Евгений Кириллов on 05.09.2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

import RandomUserAPI
import Foundation

struct BookingListInteractor {
    
    weak var bookingsRepresenter: BookingListRepresenter?
    weak var errorRepresenter: ErrorRepresenter?
    
    private let userLoader = Loader()
    
    private let bookingsCount: Int = {
        guard
            let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let info = NSDictionary(contentsOfFile: path) as? [String: AnyObject],
            let count = info["BookingsCount"] as? Int
        else {
            assertionFailure("Unable to load bookings count from Info.plist")
            return 0
        }
        return count
    }()
    
    func loadUsers() {
        userLoader.loadUsers(usersCount: bookingsCount) { loadingResult in
            switch loadingResult {
            case .success(let loadedUsers):
                let users = loadedUsers.map(User.init)
                let bookings = users.map { Booking(user: $0) }
                bookingsRepresenter?.representBookings(bookings)
            case .failure(let error):
                errorRepresenter?.representErrorText(error.localizedDescription)
            }
        }
    }
    
}
