//
//  BookingStatusViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

final class BookingStatusViewController: UIViewController {
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var statusPicker: UIPickerView!
    
    private var booking: Booking? {
        didSet {
            guard
                let booking = booking,
                let selectedIndex = Status.allCases.firstIndex(of: booking.status)
            else { return }
            detailsLabel.text = String(describing: booking.user)
            statusPicker.selectRow(selectedIndex, inComponent: 0, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusPicker.delegate = self
        statusPicker.dataSource = self
    }
}

extension BookingStatusViewController: UIPickerViewDelegate {
    
    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        Status.allCases[row].rawValue
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int
    ) {
        print("row \(row) selected, status is: \(Status.allCases[row])")
    }
}

extension BookingStatusViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Status.allCases.count
    }
    
}
