//
//  UIView+Extensions.swift
//  Experimenting
//
//  Created by Pavan Kataria on 11/10/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func fillSuperview(with insets: UIEdgeInsets = .zero) {
        guard let superview = self.superview else {
            return print("no superview")
        }
        topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top).isActive = true
        leftAnchor.constraint(equalTo: superview.leftAnchor, constant: insets.left).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom).isActive = true
        rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -insets.right).isActive = true
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}


