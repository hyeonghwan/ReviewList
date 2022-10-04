//
//  ReviewCollectionViewHeader.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/23.
//

import Foundation
import UIKit
import SnapKit

class ProfileStarRatingFooterView: UICollectionReusableView{
    
    private lazy var separatorLine: SeparatorLine = {
        let view = SeparatorLine()
        return view
    }()

    private lazy var ratingView: AverageStarRatingView = {
        let view = AverageStarRatingView()
        return view
    }()

    private lazy var separatorLine2: SeparatorLine = {
        let view = SeparatorLine()
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
    private func configure() {
        [separatorLine,ratingView,separatorLine2].forEach{
            self.addSubview($0)
        }
        separatorLine.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(8)
        }
        ratingView.snp.makeConstraints{
            $0.top.equalTo(separatorLine.snp.bottom)
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview()
        }
        separatorLine2.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(ratingView.snp.bottom)
            $0.height.equalTo(8)
        }
    }
    
}
