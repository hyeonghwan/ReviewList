//
//  UICollectionViewCell-ext.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/23.
//

import Foundation
import UIKit



protocol Identifiable {
    static var identify: String {get}
}

extension Identifiable{
    static var identify: String {
        return String(describing: Self.self)
    }
}

extension UICollectionViewCell: Identifiable{ }
extension UICollectionReusableView: Identifiable { }
