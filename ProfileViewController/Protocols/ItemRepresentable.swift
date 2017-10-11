//
//  ItemRepresentable.swift
//  Experimenting
//
//  Created by Pavan Kataria on 10/10/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import Foundation
import UIKit

public protocol ItemRepresentable {
    static func registerCell(collectionView: UICollectionView)
    func dequeueCell(collectionView: UICollectionView, forItemAt indexPath: IndexPath) -> UICollectionViewCell
    func cellSelected()
}
extension ItemRepresentable {
    public func cellSelected(){}
}
