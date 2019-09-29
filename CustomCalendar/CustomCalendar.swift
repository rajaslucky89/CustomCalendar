//
//  CustomCalendar.swift
//  CustomCalendar
//
//  Created by raja syahmudin on 23/09/19.
//  Copyright © 2019 raja syahmudin. All rights reserved.
//

import UIKit
import FSCalendar

class CustomCalendar: UIViewController {
    @IBOutlet weak var customCalendarView: CalendarView!
    var datesArray = ["2019-08-30", "2019-09-26", "2019-09-27", "2019-09-28"]
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setComponents()
    }
}

extension CustomCalendar {
    func setComponents() {
        customCalendarView.calendar.delegate = self
        customCalendarView.calendar.dataSource = self
    }
}

extension CustomCalendar: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.view.layoutIfNeeded()
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDates = calendar.selectedDates.map({self.dateFormatter.string(from: $0)})
        print("selected date is \(selectedDates)")
        
        calendar.appearance.selectionColor = .greenCustom
        self.customCalendarView.calendar = calendar
    }
    
    // for events color
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)

        var lastDateArray = [String]()
        var today = Date()
        for i in 1...30{
            let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)
            let date = DateFormatter()
            date.dateFormat = "yyyy-MM-dd"
            let stringLastDate : String = date.string(from: today)
            today = yesterday!
            lastDateArray.append(stringLastDate)
        }
        
        if datesArray.contains(dateString) {
            lastDateArray.remove(at: 0)
            if lastDateArray.contains(dateString) {
                return UIColor.grayDate
            }else{
                return UIColor.white
            }
        }else{
            return nil
        }
    }

    // for events cell
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
        let totalEvent = "1"
        cell.setUICalendar(dateEvent: datesArray, dateNow: date, totalEvent: totalEvent)
        return cell
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        calendar.reloadData()
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
    // for events dot
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let dateString = dateFormatter.string(from: date)
//        if self.datesArray.contains(dateString) {
//            return 1
//        }
//        return 0
//    }
    
}
