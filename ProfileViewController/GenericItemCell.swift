//
//  GenericCustomCell.swift
//  Experimenting
//
//  Created by Pavan Kataria on 10/10/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import Foundation
import UIKit

public class GenericItemCell<View: UIView>: UICollectionViewCell {
    public let customView = View(frame: .zero)

    public override func layoutSubviews() {
        super.layoutSubviews()
//        self.autoresizesSubviews = true
        self.customView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(customView)
        customView.fillSuperview()
    }

//    public override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.setup()
//    }
//
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    public override func layoutSubviews() {
////        contentView.frame = bounds
//        super.layoutSubviews()
//        contentView.addSubview(customView)
//        customView.fillSuperview()
//    }
//    private func setup(){
//        customView.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(self.customView)
//        self.customView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        self.customView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        self.customView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        self.customView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//    }
    
//    public override func layoutSubviews() {
//        super.layoutSubviews()
//        self.addSubview(customView)
////        customView.frame = contentView.bounds
//        customView.translatesAutoresizingMaskIntoConstraints = false
//        self.customView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        self.customView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        self.customView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        self.bottomAnchor.constraint(equalTo: customView.bottomAnchor).isActive = true
//
//    }
    
    override public func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        // note: don't change the width
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
}
