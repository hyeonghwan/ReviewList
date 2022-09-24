//
//  ProfileImageView.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/23.
//

import Foundation
import UIKit


class ProfileImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }

    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
}
