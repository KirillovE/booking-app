//
//  Status.swift
//  BookingApp
//
//  Created by Евгений Кириллов on 05.09.2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

import UIKit.UIColor

enum Status {
    case waiting
    case canceled
    case confirmed
}

extension Status {
    
    var color: UIColor {
        switch self {
        case .waiting: return .orange
        case .canceled: return .red
        case .confirmed: return .green
        }
    }
    
}
