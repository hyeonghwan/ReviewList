//
//  SeparatorLine.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/23.
//

import Foundation
import UIKit

class SeparatorLine: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.855, green: 0.859, blue: 0.871, alpha: 1)
    }
    required init?(coder: NSCoder) {
        fatalError("error")
    }
}
