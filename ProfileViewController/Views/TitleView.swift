//
//  TitleView.swift
//  ProfileViewController
//
//  Created by Pavan Kataria on 11/10/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import UIKit

public class TitleView: UIView {
    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var edgeInsets: UIEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
    public override init(frame: CGRect) {
        super.init(frame: frame)
        inintialise()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        inintialise()
    }
    
    private func inintialise() {
        backgroundColor = .red
        addSubview(label)
        self.label.fillSuperview(with: edgeInsets)
    }
}

extension TitleView {
    func setup(_ viewModel: TitleViewCellViewModel){
        self.label.text = viewModel.title
        self.backgroundColor = viewModel.backgroundColor
    }
}
