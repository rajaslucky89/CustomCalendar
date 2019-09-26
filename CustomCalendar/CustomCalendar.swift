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
//        let currentPageDate = calendar.currentPage
//        let currentMonth = Calendar.current.component(.month, from: currentPageDate)
//        let previousMonth = currentMonth - 1
//        print("bulan lalu \(previousMonth)")
        
        if datesArray.contains(dateString) {
//            if currentMonth < previousMonth {
//                return UIColor.red
//            }else{
//                return UIColor.white
//            }
            return UIColor.white
            
        }else{
            return nil
        }
    }

    // for events cell
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
        
        // Set view
//        let eventView = UIView()
//        eventView.frame = CGRect.init(x: 10, y: 0, width: 35, height: 35)
//        eventView.backgroundColor = .clear
//        eventView.layer.borderColor = UIColor.lightGray.cgColor
//        eventView.layer.borderWidth = 1
//        eventView.layer.cornerRadius = 17.5

        // Set button
//        let countEventbutton = UIButton(frame: CGRect(x: 35, y: 0, width: 14, height: 14))
//        countEventbutton.layer.borderWidth = 1
//        countEventbutton.layer.cornerRadius = 7
//        countEventbutton.titleLabel?.font =  UIFont(name: "HelveticaNeue", size: 9)
        
        //if datesArray.contains(dateString) {
        cell.setUICalendar(date: datesArray, dateNow: date)
//            countEventbutton.backgroundColor = .white
//            countEventbutton.layer.borderColor = UIColor.greenSehatQ.cgColor
//            countEventbutton.setTitleColor(.greenSehatQ, for: .normal)
//            countEventbutton.setTitle("2", for: .normal)
            //cell.addSubview(countEventbutton)
            
            //cell.addSubview(eventView)
        //}
        
        return cell
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        calendar.reloadData()
        print("changed")
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
