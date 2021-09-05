//
//  NotificationName.swift
//  BookingApp
//
//  Created by Евгений Кириллов on 05.09.2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

import Foundation

enum NotificationName: String {
    case bookingsUpdated
}

extension NotificationName {
    
    var name: Notification.Name {
        .init(rawValue)
    }
    
}
