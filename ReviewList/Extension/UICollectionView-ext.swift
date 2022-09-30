//
//  UICollectionView-ext.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/30.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func settingCollectionView(){
        self.backgroundColor = .tertiarySystemBackground
        self.register(ReviewCell.self,
                                forCellWithReuseIdentifier: ReviewCell.identify)
        self.register(ProfileCell.self,
                                forCellWithReuseIdentifier: ProfileCell.identify)
        self.register(ProfileStarRatingFooterView.self,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter , withReuseIdentifier: ProfileStarRatingFooterView.identify)
        self.register(ReviewCellHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ReviewCellHeaderView.identify)
    }
}
