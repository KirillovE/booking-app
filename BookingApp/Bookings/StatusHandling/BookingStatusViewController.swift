//
//  BookingStatusViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

final class BookingStatusViewController: UIViewController {
    @IBOutlet private weak var detailsLabel: UILabel!
    @IBOutlet private weak var statusPicker: UIPickerView!
    
    var booking: Booking?
    var statusObserver: StatusObserver?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - UIPickerViewDelegate

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
        booking?.status = Status.allCases[row]
    }
}

// MARK: - UIPickerViewDataSource

extension BookingStatusViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Status.allCases.count
    }
    
}

// MARK: - Private methods

private extension BookingStatusViewController {
    
    func initialSetup() {
        setDelegates()
        setInitialvalues()
        setNavigationItems()
    }
    
    func setDelegates() {
        statusPicker.delegate = self
        statusPicker.dataSource = self
    }
    
    func setInitialvalues() {
        guard
            let booking = booking,
            let selectedIndex = Status.allCases.firstIndex(of: booking.status)
        else { return }
        detailsLabel.text = String(describing: booking.user)
        statusPicker.selectRow(selectedIndex, inComponent: 0, animated: false)
    }
    
    func setNavigationItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(closeController)
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(saveAndClose)
        )
        
        navigationItem.title = "Change status"
    }
    
    @objc func closeController() {
        dismiss(animated: true)
    }
    
    @objc func saveAndClose() {
        defer { dismiss(animated: true) }
        guard let newStatus = booking?.status else { return }
        statusObserver?.handleNewStatus(newStatus)
    }
    
}
