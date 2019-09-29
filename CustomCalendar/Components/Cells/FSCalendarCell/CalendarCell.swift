//
//  CalendarCell.swift
//  CustomCalendar
//
//  Created by raja syahmudin on 24/09/19.
//  Copyright © 2019 raja syahmudin. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarCell: FSCalendarCell {
    private lazy var eventView: UIView = {
        let eventView = UIView()
        eventView.frame = CGRect.init(x: 10, y: 0, width: 35, height: 35)
        eventView.backgroundColor = .clear
        eventView.layer.borderColor = UIColor.lightGray.cgColor
        eventView.layer.borderWidth = 1
        eventView.layer.cornerRadius = 17.5
        return eventView
    }()
    
    private lazy var countEventButton: UIButton = {
        let countEventbutton = UIButton(frame: CGRect(x: 35, y: 0, width: 14, height: 14))
        countEventbutton.layer.borderWidth = 1
        countEventbutton.layer.cornerRadius = 7
        countEventbutton.titleLabel?.font =  UIFont(name: "HelveticaNeue", size: 9)
        countEventbutton.backgroundColor = .white
        countEventbutton.layer.borderColor = UIColor.greenCustom.cgColor
        countEventbutton.setTitleColor(.greenCustom, for: .normal)
        return countEventbutton
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        eventView.removeFromSuperview()
        countEventButton.removeFromSuperview()
    }
}

// MARK: Public
extension CalendarCell {
    func bind(dateEvent: [String], dateNow: Date, totalEvent: String) {
        // Check by date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: dateNow)
        
        if dateEvent.contains(dateString) {
            self.countEventButton.setTitle(totalEvent, for: .normal)
            self.contentView.addSubview(eventView)
            self.contentView.addSubview(countEventButton)
        }
    }
}
