//
//  ProfileView.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/23.
//

import Foundation
import UIKit
import SnapKit

class ProfileView: UIView {
    
    private lazy var containerStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var profileImageView: ProfileImageView = {
        let imageView = ProfileImageView(frame: .zero)
        imageView.image = UIImage(systemName: "pencil")
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 2
        return imageView
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.spacing = 16
        return stack
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.settingNameLabel()
        label.text = "오늘도 빡코딩"
        return label
    }()
    
    private lazy var hStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 41
        return stack
    }()
    
    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        
        label.settingFollowLabel()
        label.text = "팔로잉 66"
        return label
    }()
    
    private lazy var followerLabel: UILabel = {
        let label = UILabel()
        label.settingFollowLabel()
        label.text = "팔로워 66"
        return label
    }()
    
    private lazy var introduceLabel: UILabel = {
        let label = UILabel()
        label.settingIntroduceLabel()
        return label
    }()
    
    private lazy var followButton: UIButton = {
       let button = UIButton()
        button.settingFollowButton()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
}
extension ProfileView {
    private func configure() {
        [containerStackView,introduceLabel,followButton].forEach{
            self.addSubview($0)
        }
        
        containerStackView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().offset(-30)
        }
        [profileImageView,vStackView].forEach{
            containerStackView.addArrangedSubview($0)
        }
        [nameLabel,hStackView].forEach{
            vStackView.addArrangedSubview($0)
        }
        
        [followingLabel,followerLabel].forEach{
            hStackView.addArrangedSubview($0)
        }
        
        profileImageView.snp.makeConstraints{
            $0.width.height.equalTo(100)
        }
        introduceLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(29)
            $0.top.equalTo(containerStackView.snp.bottom).offset(34)
        }
        followButton.snp.makeConstraints{
            $0.top.equalTo(introduceLabel.snp.bottom).offset(40)
            $0.height.equalTo(40)
            $0.leading.trailing.equalToSuperview().inset(17)
        }
    }
}
