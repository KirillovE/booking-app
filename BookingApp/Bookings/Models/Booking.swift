//
//  Booking.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import Foundation.NSString

struct Booking {
    let user: User
    var status: Status = .waiting
}

extension Booking: CustomStringConvertible {
    
    var description: String {
        """
        \(NSLocalizedString("Booking status", comment: "")): \(status)
        \(NSLocalizedString("Client", comment: "")) – \(user)
        """
    }
    
}
