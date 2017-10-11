//
//  RoundedImageView.swift
//  CommonUI
//
//  Created by Vaughan Reid on 25/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

open class RoundedImageView: UIImageView {
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.width / 2.0
        layer.masksToBounds = true
    }
}
