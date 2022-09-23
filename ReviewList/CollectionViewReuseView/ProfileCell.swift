//
//  ProfileCell.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/23.
//

import Foundation
import UIKit
import SnapKit

class ProfileCell: UICollectionViewCell {
    
    private lazy var profileView: ProfileView = {
        let profileView = ProfileView()
        
        return profileView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    private func configure() {
        
        self.contentView.addSubview(profileView)
        
        profileView.snp.makeConstraints{
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(350)
        }
    }
    
    
}
