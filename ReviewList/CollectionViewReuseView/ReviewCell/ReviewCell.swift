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
    
   
    private lazy var titleView: ReviewCellTitleView = {
        let view = ReviewCellTitleView()
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
    
    private lazy var changeLineButton: UIButton = {
        let button = UIButton()
        button.settingChangeLineButton()
        return button
    }()
    
    private lazy var actionView: HBDActionView = {
        let actionView = HBDActionView()
        return actionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        //size Test
//        print(layoutAttributes.size)
//        print(self.reviewContent.calculateMaxLines())
//        print(self.reviewContent.maxNumberOfLines)
//        print(Float.infinity)
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
    
    
}
private extension ReviewCell {
    func configure() {
       
        
        [titleView,reviewTitle,reviewContent,changeLineButton,actionView].forEach{
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
        changeLineButton.snp.makeConstraints{
            $0.top.equalTo(reviewContent.snp.bottom)
            $0.trailing.equalToSuperview().inset(20)
           
        }
        actionView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(changeLineButton.snp.bottom).offset(25)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        
    }
}
