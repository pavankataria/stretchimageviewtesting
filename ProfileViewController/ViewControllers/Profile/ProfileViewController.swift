//
//  ViewController.swift
//  ProfileViewController
//
//  Created by Pavan Kataria on 11/10/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var viewModel: ProfileViewModel = ProfileViewModel()
    
    lazy var layout: WaterfallLayout = {
        let layout = WaterfallLayout()
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        layout.estimatedItemSize = CGSize(width: 100, height: 40)
        layout.delegate = self
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.brown
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        self.view.addSubview(collectionView)
        self.collectionView.fillSuperview()
        self.viewModel.cellViewModelTypes.forEach{$0.registerCell(collectionView: self.collectionView)}
    }
}
extension ProfileViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel.dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.dataSource[section].items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellViewModel = self.viewModel.dataSource[indexPath.section].items[indexPath.row]
        let cell = cellViewModel.dequeueCell(collectionView: collectionView, forItemAt: indexPath)
        return cell
    }
    
}
extension ProfileViewController: WaterfallLayoutDelegate {
    func collectionViewLayout(for section: Int) -> WaterfallLayout.Layout {
        return .flow(column: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: WaterfallLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return WaterfallLayout.automaticSize
    }
}
//extension ProfileViewController: CHTCollectionViewDelegateWaterfallLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 30)
//    }
//}

