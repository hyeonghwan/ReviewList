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
    
    private var lineChangeDelegate: ReviewLineChangeDelegate?
    private var indexPath: IndexPath?
    private var reviewModel: ReviewModel?
   
    var reloadLine: (() -> Void)? {
        didSet{
            print("setting reload Line")
        }
    }
    
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
        button.backgroundColor = .white
        return button
    }()
    
    private lazy var actionView: HBDActionView = {
        let actionView = HBDActionView()
        return actionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        changeLineButton.addTarget(self, action: #selector(changeLine(_ :)), for: .touchUpInside)
       
    }
    @objc func changeLine(_ sender: UIButton) {
        print("changeLinechangeLinechangeLine")
        guard var model = reviewModel else {return}
        model.lineFlag.toggle()
        reviewModel = model
        self.lineChangeDelegate?.changeReviewContentLine(self.indexPath,reviewModel)
    }
    func updateSettingUI(_ delegate: ReviewLineChangeDelegate,_ indexPath: IndexPath,_ reviewModel: ReviewModel){
        self.lineChangeDelegate = delegate
        self.indexPath = indexPath
        self.reviewModel = reviewModel
        self.reviewContent.text = reviewModel.content
        self.reviewContent.numberOfLines = self.reviewModel!.lineFlag ? 0 : 5
        print("updateSettingUI")
    }
    
    override func prepareForReuse() {
        print("prepareForReuse")
        self.reviewContent.text = nil
//        self.reviewContent.numberOfLines = 5
        self.reviewModel = nil
        self.indexPath = nil
        self.lineChangeDelegate = nil
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        print("contentView -> \(self.contentView.frame) \n selfNUMBER -> \(self.reviewContent.numberOfLines)")
        
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }

//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        //Exhibit A - We need to cache our calculation to prevent a crash.
//            setNeedsLayout()
//            layoutIfNeeded()
//            let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
//            var newFrame = layoutAttributes.frame
//
//        let targetSize = CGSize(width: UIScreen.main.bounds.width, height: 0)
//
//         let width =  contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
//            print("newFrame -> \(newFrame)")
//            layoutAttributes.frame = newFrame
//
//        return layoutAttributes
//    }
    
//    override func systemLayoutSizeFitting(
//          _ targetSize: CGSize, withHorizontalFittingPriority
//          horizontalFittingPriority: UILayoutPriority,
//          verticalFittingPriority: UILayoutPriority) -> CGSize {
//
//              setNeedsLayout()
//              layoutIfNeeded()
//
//              var targetSize = targetSize
//              targetSize.height = CGFloat.greatestFiniteMagnitude
//              let size = super.systemLayoutSizeFitting(
//                targetSize,
//                withHorizontalFittingPriority: .required,
//                verticalFittingPriority: .fittingSizeLevel)
//
//              print("\(#function) \(#line) \(targetSize) -> \(size)")
//              return size
//          }
    
//    
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//
//        if !isHeightCalculated {
//            setNeedsLayout()
//            layoutIfNeeded()
//            print("preferredLayoutAttributesFitting")
//            let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
//            var frame = layoutAttributes.frame
//            frame.size.width = UIScreen.main.bounds.width
//            frame.size.height = size.height
//            layoutAttributes.frame = frame
//            isHeightCalculated = true
//        }
//        return layoutAttributes
//    }
    
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//            self.reviewContent.preferredMaxLayoutWidth = layoutAttributes.size.width
//            layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
//            isHeightCalculated = true
//            return layoutAttributes
//        }
    
}
private extension ReviewCell {
    func configure() {
        self.contentView.backgroundColor = .brown
       
        [titleView,reviewTitle,reviewContent,changeLineButton,actionView].forEach{
            self.contentView.addSubview($0)
        }
      
        titleView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(180)
        }
        reviewTitle.snp.makeConstraints{
            $0.top.equalTo(titleView.snp.bottom).offset(24)
            $0.width.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(25)
        }
        reviewContent.snp.makeConstraints{
            
            $0.top.equalTo(reviewTitle.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
       
        changeLineButton.snp.makeConstraints{
            $0.top.equalTo(reviewContent.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(25)
           
        }
        actionView.snp.makeConstraints{
            $0.top.equalTo(changeLineButton.snp.bottom).offset(25)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        
    }
}
