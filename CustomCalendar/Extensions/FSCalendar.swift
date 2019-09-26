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
        guard let cell = self as? CalendarCell else {
            return
        }
        cell.bind(date: date, dateNow: dateNow)
    }
}
