//
//  ReviewCell.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/23.
//

import Foundation
import UIKit
import SnapKit

class ReviewCell: UICollectionViewCell{
    
   
    private lazy var titleView: ReviewCellTitle = {
        let view = ReviewCellTitle()
        return view
    }()

    private lazy var reviewTitle: UILabel = {
        let label = UILabel()
        label.settingReviewTitle()
        
        return label
    }()

    private lazy var reviewContent: UILabel = {
        let label = UILabel()
        label.settingReviewContent()
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        self.contentView.backgroundColor = .systemGray
        
    }
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
    
    
}
private extension ReviewCell {
    func configure() {
        self.contentView.backgroundColor = .systemCyan
        
        [titleView,reviewTitle,reviewContent].forEach{
            self.contentView.addSubview($0)
        }
        titleView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(180)
        }
        reviewTitle.snp.makeConstraints{
            $0.top.equalTo(titleView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(16)
        }
        reviewContent.snp.makeConstraints{
            $0.top.equalTo(reviewTitle.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().inset(16)
            
            
            
        }
    }
}
