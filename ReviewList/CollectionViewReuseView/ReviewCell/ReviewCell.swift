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
    
    private var lineChangeDelegate: ReviewActionDelegate?
    private var indexPath: IndexPath?
    private var reviewModel: ReviewCellModel?
   
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var titleView: ReviewCellTitleView = {
        let view = ReviewCellTitleView()
        return view
    }()

    private lazy var reviewTitle: UILabel = {
        let label = UILabel()
        label.settingReviewTitle()
        return label
    }()

    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .top
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var reviewContent: UILabel = {
        let label = UILabel()
        label.settingReviewContent()
        label.numberOfLines = 5
        return label
    }()
    
    private lazy var changeLineButton: ChangeLineButton = {
        let button = ChangeLineButton()
        
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
        
        guard var model = reviewModel else {return}
        model.lineFlag.toggle()
        reviewModel = model
        
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.reviewContent.alpha = 0
                self.changeLineButton.alpha = 0
                self.layoutIfNeeded()
            },
            completion: nil
        )
        
        let generator = UIImpactFeedbackGenerator(style: .soft)
        generator.impactOccurred()
        
        self.lineChangeDelegate?.changeReviewContentLine(self.indexPath,reviewModel)
    }
    
    func calculateViewHeight(_ indexPath: IndexPath,_ reviewModel: ReviewCellModel){
        self.indexPath = indexPath
        self.reviewModel = reviewModel
        self.reviewContent.text = reviewModel.content
        self.reviewContent.numberOfLines = self.reviewModel!.lineFlag ? 0 : 5
        
    }
    
    func updateSettingUI(_ delegate: ReviewActionDelegate,
                         _ indexPath: IndexPath,
                         _ reviewModel: ReviewCellModel){
        setNeedsLayout()
        layoutIfNeeded()
        
        self.lineChangeDelegate = delegate
        self.indexPath = indexPath
        self.reviewModel = reviewModel
        self.reviewContent.text = reviewModel.content
        
        self.reviewContent.alpha = 1
        self.changeLineButton.alpha = 1
        
        self.reviewContent.numberOfLines = self.reviewModel!.lineFlag ? 0 : 5
        self.reviewContent.sizeToFit()
        
        self.changeLineButton.isHidden = false
        self.changeLineButton.setTitle(line: self.reviewContent.numberOfLines,
                                       count: self.reviewContent.calculateMaxLines(CGSize(width: self.reviewContent.bounds.width,height: CGFloat.infinity)),
                                       for: .normal)
        
        self.actionView.updateHeart(delegate,indexPath,reviewModel)
        
        self.titleView.updateTitleUI(reviewModel.reviewCellTitleData)
        
    }
    
    override func prepareForReuse() {
        self.reviewContent.text = nil
        self.reviewModel = nil
        self.indexPath = nil
        self.lineChangeDelegate = nil
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
    }
    
}
private extension ReviewCell {
    func configure() {
       
        [separatorView,titleView,reviewTitle,vStackView,actionView].forEach{
            self.contentView.addSubview($0)
        }
        separatorView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
      
        titleView.snp.makeConstraints{
            $0.top.equalTo(separatorView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(180)
        }
        reviewTitle.snp.makeConstraints{
            $0.top.equalTo(titleView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        vStackView.snp.makeConstraints{
            $0.top.equalTo(reviewTitle.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        
        [reviewContent,changeLineButton].forEach{
            vStackView.addArrangedSubview($0)
        }
        
        reviewContent.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
        }
       
        changeLineButton.snp.makeConstraints{
            $0.trailing.equalToSuperview()
        }
        actionView.snp.makeConstraints{
            $0.top.equalTo(vStackView.snp.bottom)
            $0.height.equalTo(80)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
