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
    func fillSuperview() {
        guard let superview = self.superview else {
            return print("no superview")
        }
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
    }
}

