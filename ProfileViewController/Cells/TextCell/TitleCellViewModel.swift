//
//  TitleCellViewModel.swift
//  ProfileViewController
//
//  Created by Pavan Kataria on 11/10/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import Foundation
import UIKit

public class TitleViewCellViewModel {
    let title: String
    let backgroundColor: UIColor = .random()
    init(title: String){
        self.title = title
    }
}
extension TitleViewCellViewModel: ItemRepresentable {
    private struct Properties {
        static let identifier = "CustomCellTitleView"
    }
    
    //    WORKS
    public static func registerCell(collectionView: UICollectionView) {
        collectionView.register(GenericItemCell<TitleView>.self, forCellWithReuseIdentifier: Properties.identifier)
    }

    public func dequeueCell(collectionView: UICollectionView, forItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Properties.identifier, for: indexPath) as? GenericItemCell<TitleView> else {
            fatalError("Couldn't dequeue generic item cell of type Title View")
        }
        cell.customView.setup(self)
        return cell
    }

    //    WORKS
//    public static func registerCell(collectionView: UICollectionView) {
//        collectionView.register(UINib(nibName: String(describing: TitleCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: Properties.identifier)
//    }
//    public func dequeueCell(collectionView: UICollectionView, forItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Properties.identifier, for: indexPath) as? TitleCollectionViewCell else {
//            fatalError("Couldn't dequeue generic item cell of type Title View")
//        }
//        cell.setup(self)
//        return cell
//    }
    
    func cellSelected(_ indexPath: IndexPath) {
    }
}
