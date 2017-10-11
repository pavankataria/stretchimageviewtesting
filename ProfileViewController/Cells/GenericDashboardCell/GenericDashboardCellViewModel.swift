//
//  GenericDashboardCellViewModel.swift
//  Experimenting
//
//  Created by Pavan Kataria on 10/10/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import Foundation
import UIKit


public class GenericDashboardCellViewModel: ItemRepresentable {
    var productsCount: Int = 0
    var followersCount: Int = 0
    var followingCount: Int = 0

//    private struct Properties {
//        static let identifier = "GenericDashboardCell"
//    }
//    public static func registerCell(collectionView: UICollectionView) {
//        collectionView.register(GenericDashboardCell.self, forCellWithReuseIdentifier: Properties.identifier)
//    }
//    public func dequeueCell(collectionView: UICollectionView, forItemAt indexPath: IndexPath) -> UICollectionViewCell {
//                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Properties.identifier, for: indexPath) as? GenericDashboardCell else {
//                    fatalError("This should load GenericDashboardCell")
//                }
//                cell.configure(self)
//                return cell
//
//    }
    private struct Properties {
        static let identifier = "CustomCellGenericDashboardView"
    }
    public static func registerCell(collectionView: UICollectionView) {
        collectionView.register(GenericItemCell<GenericDashboardView>.self, forCellWithReuseIdentifier: Properties.identifier)
    }
    
    public func dequeueCell(collectionView: UICollectionView, forItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Properties.identifier, for: indexPath) as? GenericItemCell<GenericDashboardView> else {
            fatalError("Couldn't dequeue generic item cell of type Title View")
        }
        cell.customView.configure(self)
        return cell
    }
    public func cellSelected() {}
}


extension GenericDashboardView {
    public func configure(_ viewModel: GenericDashboardCellViewModel){

    }
}

