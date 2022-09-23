//
//  UIImage-ext.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/23.
//

import Foundation
import UIKit

extension UIImageView{
    func setStoreImageSquare(){
        self.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
