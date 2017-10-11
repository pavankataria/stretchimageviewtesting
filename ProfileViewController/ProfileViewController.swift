//
//  ViewController.swift
//  ProfileViewController
//
//  Created by Pavan Kataria on 11/10/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    lazy var layout: CHTCollectionViewWaterfallLayout = {
        let layout = CHTCollectionViewWaterfallLayout()
        layout.columnCount = 1
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.brown
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        self.view.addSubview(collectionView)
        self.collectionView.fillSuperview()
    }
}
