//
//  ReviewCellHeaderView.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/30.
//

import Foundation
import UIKit
import SnapKit

class ReviewCellHeaderView: UICollectionReusableView{
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.settingNameLabel()
        label.text = "Hwan"
        label.font = UIFont.init(name: "NanumGothicBold", size: 20)
        return label
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.settingNameLabel()
        label.text = "님의 리뷰"
        label.font = UIFont.init(name: "NanumGothic", size: 20)
        return label
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.settingNameLabel()
        label.text = "12개"
        label.textColor = UIColor.lightGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
    func configure() {
        [title,subtitle,countLabel].forEach{
            self.addSubview($0)
        }
        title.snp.makeConstraints{
            
            $0.leading.equalToSuperview().inset(18)
            $0.top.equalToSuperview().inset(30)
        }
        subtitle.snp.makeConstraints{
            $0.leading.equalTo(title.snp.trailing).offset(10)
            $0.top.equalToSuperview().inset(30)
        }
        countLabel.snp.makeConstraints{
            $0.leading.equalTo(subtitle.snp.trailing).offset(13)
            $0.top.equalToSuperview().inset(30)
        }
    }
}
