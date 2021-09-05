//
//  StatusObserver.swift
//  BookingApp
//
//  Created by Евгений Кириллов on 05.09.2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

protocol StatusObserver: AnyObject {
    func handleNewStatus(_ newStatus: Status)
}
