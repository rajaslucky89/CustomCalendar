//
//  UIView.swift
//  CustomCalendar
//
//  Created by raja syahmudin on 26/09/19.
//  Copyright © 2019 raja syahmudin. All rights reserved.
//

import UIKit

extension UIView {
    func round(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
