//
//  ReviewCellTitle.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/23.
//

import Foundation
import UIKit
import SnapKit

class ReviewCellTitleView: UIView {
    
    private lazy var hstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setStoreImageSquare()
        return imageView
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.settingNameLabel()
        return label
    }()
    private lazy var storeName: UILabel = {
        let label = UILabel()
        label.settingNameLabel()
        label.font = UIFont(name: "NanumGothic", size: 18)
        return label
    }()
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        stackView.axis = .vertical
        return stackView
    }()
    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Star")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private lazy var starScoreLabel: UILabel = {
        let label = UILabel()
        label.settingNameLabel()
        return label
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NanumGothic", size: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    func updateTitleUI(_ titleContext: ReviewCellModel.ReviewCellTitleModel) {
        self.profileImageView.image = UIImage(named: titleContext.storeTitleImage)
        self.nameLabel.text = titleContext.storeTitleName
        self.storeName.text = titleContext.storeTitleRegion
        self.dateLabel.text = titleContext.date
        self.starScoreLabel.text = titleContext.starRating
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
    }
    
}
private extension ReviewCellTitleView {
    func configure() {
        
        [hstackView,starImageView,starScoreLabel,dateLabel].forEach{
            self.addSubview($0)
        }
        hstackView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(16)
        }
        
        [profileImageView,vStackView].forEach {
            self.hstackView.addArrangedSubview($0)
        }
        
        profileImageView.snp.makeConstraints{
            $0.width.height.equalTo(100)
        }
        
        [nameLabel,storeName].forEach {
            self.vStackView.addArrangedSubview($0)
        }
        
        starImageView.snp.makeConstraints{
            $0.width.height.equalTo(20)
            $0.top.equalTo(profileImageView.snp.bottom).offset(28.5)
            $0.leading.equalToSuperview().inset(18)
        }
        starScoreLabel.snp.makeConstraints{
            $0.top.equalTo(starImageView.snp.top)
            $0.leading.equalTo(starImageView.snp.trailing).offset(10)
        }
        dateLabel.snp.makeConstraints{
            $0.top.equalTo(starImageView.snp.top)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
