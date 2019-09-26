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
    required init!(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init!(frame: CGRect) {
        super.init(frame: frame)
        //let viewBackground = UIView(frame: bounds)
        //viewBackground.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        //backgroundView = viewBackground
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //self.backgroundView?.frame = self.bounds.insetBy(dx: 1, dy: 1)
    }
}
