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
        stackView.spacing = 8
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var profileImageView: ProfileImageView = {
        let imageView = ProfileImageView(frame: .zero)
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
        stack.spacing = 20
        return stack
    }()
    
    private lazy var followingStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 6
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var followerStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 6
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var followingLabelName: UILabel = {
        let label = UILabel()
        
        label.settingFollowLabel()
        label.text = "팔로잉"
        return label
    }()
    
    private lazy var followingCountLabel: UILabel = {
        let label = UILabel()
        label.settingFollowLabel()
        label.text = "10"
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(red: 0.855, green: 0.859, blue: 0.871, alpha: 1)
        return separatorView
    }()
    
    private lazy var followerLabelName: UILabel = {
        let label = UILabel()
        label.settingFollowLabel()
        label.text = "팔로워"
        return label
    }()
    
    private lazy var followerCountLabel: UILabel = {
        let label = UILabel()
        label.settingFollowLabel()
        label.text = "10"
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
    
    func updateCellContent(_ profileModel: ProfileModel) {
        
        let data = profileModel
        self.profileImageView.image = UIImage(named: data.image)
        self.nameLabel.text = data.name
        self.followingCountLabel.text = data.followingCount.toString()
        self.followerCountLabel.text = data.followerCount.toString()
        
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
            $0.trailing.equalToSuperview()
        }
        
        [profileImageView,vStackView].forEach{
            containerStackView.addArrangedSubview($0)
        }
        
        profileImageView.snp.makeConstraints{
            $0.width.height.equalTo(100)
        }
        
        [nameLabel,hStackView].forEach{
            vStackView.addArrangedSubview($0)
        }
        
        nameLabel.snp.makeConstraints{
            $0.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }
        
        [followingLabelName,followingCountLabel].forEach{
            self.followingStackview.addArrangedSubview($0)
        }
        
        [followerLabelName,followerCountLabel].forEach{
            self.followerStackview.addArrangedSubview($0)
        }
        
        [followingStackview,separatorView,followerStackview].forEach{
            hStackView.addArrangedSubview($0)
        }
        
        hStackView.snp.makeConstraints{
            $0.trailing.lessThanOrEqualToSuperview()
        }
        
        separatorView.snp.makeConstraints{
            $0.width.equalTo(2)
            $0.height.equalTo(16)
        }
        
        introduceLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(29)
            $0.trailing.equalToSuperview().inset(29)
            $0.top.equalTo(containerStackView.snp.bottom).offset(34)
        }
        
        followButton.snp.makeConstraints{
            $0.top.equalTo(introduceLabel.snp.bottom).offset(40)
            $0.height.equalTo(40)
            $0.leading.trailing.equalToSuperview().inset(17)
        }
    }
}
