//
//  GenericDataSourceSection.swift
//  Experimenting
//
//  Created by Pavan Kataria on 10/10/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import Foundation

public struct GenericDataSourceSection<T> {
    public var items: [T]
    public var supplementaryItems: [String: Any]? = nil
}
