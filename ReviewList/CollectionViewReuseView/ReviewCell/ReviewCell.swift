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
        label.numberOfLines = 5
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
        changeLineButton.addTarget(self, action: #selector(changeLine(_ :)), for: .touchUpInside)
       
    }
    @objc func changeLine(_ sender: UIButton) {
        print("changeLine clicked")
        print("indexPath: \(self.indexPath)")
        guard var model = reviewModel else {return}
        model.lineFlag.toggle()
        reviewModel = model
        self.reviewContent.numberOfLines = self.reviewModel?.lineFlag ?? false ? 0 : 5
        self.lineChangeDelegate?.changeReviewContentLine(self.indexPath,reviewModel)
    }
    func updateSettingUI(_ delegate: ReviewLineChangeDelegate,_ indexPath: IndexPath,_ reviewModel: ReviewModel){
        self.lineChangeDelegate = delegate
        self.indexPath = indexPath
        self.reviewModel = reviewModel
        self.reviewContent.numberOfLines = self.reviewModel?.lineFlag ?? false ? 0 : 5
    }
    
    override func prepareForReuse() {
        self.reviewModel = nil
        self.lineChangeDelegate = nil
        self.indexPath = nil
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubviews  ")
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        print("setNeddsLayout")
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        print("layoutIfNedded")
    }

    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
        
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
    
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
