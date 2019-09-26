//
//  FSCalendar.swift
//  CustomCalendar
//
//  Created by raja syahmudin on 24/09/19.
//  Copyright © 2019 raja syahmudin. All rights reserved.
//

import UIKit
import FSCalendar

extension FSCalendar {
    func customLayoutViewSehatQ() {
        today = nil
        register(CalendarCell.self, forCellReuseIdentifier: "cell")
        calendarHeaderView.backgroundColor = .clear
        calendarWeekdayView.backgroundColor = .greenCustom
        appearance.headerDateFormat = "MMMM y"
        appearance.headerTitleColor = .black
        appearance.weekdayTextColor = .white
        appearance.titleDefaultColor = .black
        appearance.titlePlaceholderColor = UIColor.gray
        appearance.selectionColor = .greenCustom
        appearance.titleSelectionColor = .white
        appearance.titleTodayColor = .black
        appearance.headerTitleFont = UIFont(name: "HelveticaNeue", size: 17)
        appearance.weekdayFont = UIFont(name: "HelveticaNeue", size: 13)
        headerHeight = 40
        weekdayHeight = 30
        clipsToBounds = true
    }
}

extension FSCalendarCell {
    func setUICalendar(date: [String], dateNow: Date) {
        // Set view
        let eventView = UIView()
        eventView.frame = CGRect.init(x: 10, y: 0, width: 35, height: 35)
        eventView.backgroundColor = .clear
        eventView.layer.borderColor = UIColor.lightGray.cgColor
        eventView.layer.borderWidth = 1
        eventView.layer.cornerRadius = 17.5
        
        
        // Set button
        let countEventbutton = UIButton(frame: CGRect(x: 35, y: 0, width: 14, height: 14))
        countEventbutton.layer.borderWidth = 1
        countEventbutton.layer.cornerRadius = 7
        countEventbutton.titleLabel?.font =  UIFont(name: "HelveticaNeue", size: 9)
        countEventbutton.backgroundColor = .white
        countEventbutton.layer.borderColor = UIColor.greenCustom.cgColor
        countEventbutton.setTitleColor(.greenCustom, for: .normal)
        countEventbutton.setTitle("2", for: .normal)
        
        // Check by date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: dateNow)
        //let dateFilter = date.filter { $0.contains(dateString) }
        print("result date from layout \(dateString)")
        if date.contains(dateString) {
            self.contentView.addSubview(eventView)
            self.contentView.addSubview(countEventbutton)
        }
    }
}
