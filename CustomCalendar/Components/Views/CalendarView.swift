//
//  CalendarView.swift
//  CustomCalendar
//
//  Created by raja syahmudin on 23/09/19.
//  Copyright © 2019 raja syahmudin. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarView: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var calendarView: UIView!
    
    var calendar: FSCalendar!
    let nibName = "CalendarView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setupCalendar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        setupCalendar()
    }
}

//  MARK: - Set Xib
extension CalendarView {
    func xibSetup() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    
    func setupCalendar() {
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*0.9))
        //calendar.appearance.headerDateFormat = "MMM y"
        calendarView.addSubview(calendar)
        calendar.customLayoutViewSehatQ()
        self.calendar = calendar
    }
}
