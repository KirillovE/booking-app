//
//  BookingListInteractor.swift
//  BookingApp
//
//  Created by Евгений Кириллов on 05.09.2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

import RandomUserAPI

struct BookingListInteractor {
    
    weak var bookingsRepresenter: BookingListRepresenter?
    weak var errorRepresenter: ErrorRepresenter?
    
    private let userLoader = Loader()
    
    func loadUsers() {
        userLoader.loadUsers(usersCount: 1) { loadingResult in
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
