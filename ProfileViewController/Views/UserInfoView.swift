//
//  UserInfoView.swift
//  Experimenting
//
//  Created by Pavan Kataria on 10/10/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import Foundation
import UIKit


fileprivate struct Properties {
    static let padding: CGFloat = 5
    static let labelYPadding: CGFloat = 0
    static let nameLabelColor: UIColor = UIColor(red: 63/255, green: 63/255, blue: 63/255, alpha: 1)
    static let usernameLabelColor: UIColor = UIColor(red: 63/255, green: 63/255, blue: 63/255, alpha: 1)
}

public class UserInfoView: UIView {
    //MARK: - Properties
    public var name: NSAttributedString {
        didSet {
            self.nameLabel.attributedText = name
        }
    }
    public var username: NSAttributedString {
        didSet {
            self.usernameLabel.attributedText = username
        }
    }
    public var profileImage: UIImage? {
        didSet {
            self.profileImageView.image = profileImage
        }
    }
    
    public var edgeInsets: UIEdgeInsets = UIEdgeInsets(top: Properties.padding, left: Properties.padding, bottom: Properties.padding, right: Properties.padding)
    
    public var labelYPadding: CGFloat = Properties.labelYPadding
    
    //MARK: - Private
    /// Default properties
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Properties.nameLabelColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
//        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var profileImageView: RoundedImageView = {
        let imageView = RoundedImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    class TransparentRatioView: UIView {}
    private lazy var transparentAspectRatioView: TransparentRatioView = {
        let view = TransparentRatioView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.9, green: 0.5, blue: 0.5, alpha: 0.5)
        return view
    }()
    
//    private lazy var labelContainerView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .black
//        return view
//    }()
    
    //MARK: - Lifecycle
    public convenience init(){
        self.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        self.name = NSAttributedString()
        self.username = NSAttributedString()
        super.init(frame: frame)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("not implement yet")
    }
    
    private func setup(){
        self.setupViews()
        self.setupAutolayoutConstraints()
        self.backgroundColor = .red
        self.nameLabel.backgroundColor = .brown
        self.usernameLabel.backgroundColor = .green
        self.name = NSAttributedString(string: "lol")
        self.username = NSAttributedString(string: "lol")
    }
    
    func setupViews(){
        [transparentAspectRatioView, containerView].forEach(addSubview)
//        [profileImageView, nameLabel].forEach(addSubview)
//        [nameLabel, usernameLabel].forEach(labelContainerView.addSubview)
    }
    
    func setupAutolayoutConstraints(){
        self.transparentAspectRatioView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.transparentAspectRatioView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        self.transparentAspectRatioView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        self.transparentAspectRatioView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 3/11).isActive = true
        let constraint = self.transparentAspectRatioView.bottomAnchor.constraint(equalTo: bottomAnchor)
        constraint.priority = UILayoutPriority.init(rawValue: 200)
        constraint.isActive = true
        
//        self.containerView.topAnchor.constraint(equalTo: transparentAspectRatioView.bottomAnchor).isActive = true
//        self.containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        self.containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
////        self.containerView.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor).isActive = true
//
//        let spacing: CGFloat = Properties.padding
//        self.profileImageView.heightAnchor.constraint(equalTo: self.profileImageView.widthAnchor).isActive = true
//
//        self.profileImageView.centerYAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
//        self.profileImageView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: spacing).isActive = true
//
//        self.profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//
//        self.nameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
//        self.nameLabel.leftAnchor.constraint(equalTo: self.profileImageView.rightAnchor).isActive = true
//        self.nameLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
//        self.containerView.bottomAnchor.constraint(equalTo: self.profileImageView.bottomAnchor).isActive = true
//        self.bottomAnchor.constraint(greaterThanOrEqualTo: self.containerView.bottomAnchor).isActive = true

//
//        self.labelContainerView.leftAnchor.constraint(equalTo: self.profileImageView.rightAnchor).isActive = true
//        self.labelContainerView.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
//        self.labelContainerView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
//        self.labelContainerView.bottomAnchor.constraint(greaterThanOrEqualTo: self.containerView.bottomAnchor).isActive = true
//
////
//        self.nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
//
//        self.nameLabel.leftAnchor.constraint(equalTo: containerV.leftAnchor).isActive = true
//        self.nameLabel.topAnchor.constraint(equalTo: labelContainerView.topAnchor).isActive = true
//        self.nameLabel.rightAnchor.constraint(equalTo: labelContainerView.rightAnchor).isActive = true
//        self.nameLabel.bottomAnchor.constraint(equalTo: labelContainerView.bottomAnchor).isActive = true
//        self.usernameLabel.leftAnchor.constraint(equalTo: labelContainerView.leftAnchor, constant: spacing).isActive = true
//        self.usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: spacing).isActive = true
//        self.usernameLabel.rightAnchor.constraint(equalTo: labelContainerView.rightAnchor, constant: spacing).isActive = true
//
//        self.usernameLabel.bottomAnchor.constraint(equalTo: labelContainerView.bottomAnchor, constant: spacing).isActive = true
//        self.labelContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        //        self.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor).isActive = true
//        self.containerView.bottomAnchor.constraint(equalTo: self.profileImageView.bottomAnchor).isActive = true
//        self.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true

        
        
        
//        self.containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        
//        self.profileImageView.centerYAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
//        self.profileImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1.2).isActive = true
//        self.profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor).isActive = true
//        self.profileImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: self.edgeInsets.left).isActive = true
//
//        self.nameLabel.topAnchor.constraint(equalTo:containerView.topAnchor, constant: self.edgeInsets.top).isActive = true
//        self.usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: self.labelYPadding).isActive = true
//        self.usernameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -self.edgeInsets.bottom).isActive = true
//
//        self.nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: spacing).isActive = true
//        self.nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -self.edgeInsets.right).isActive = true
//
//        self.usernameLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
//        self.usernameLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
//        self.nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        self.usernameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
//        self.profileImageView.setContentHuggingPriority(.init(rawValue: 999), for: .horizontal)
//        self.profileImageView.setContentHuggingPriority(.init(rawValue: 999), for: .vertical)
//        self.nameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 800), for: .vertical)
//        self.usernameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 800), for: .vertical)
//        self.nameLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 999), for: .horizontal)
//        self.usernameLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 999), for: .horizontal)
    }
}

