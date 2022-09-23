//
//  AverageStarRating.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/23.
//

import Foundation
import UIKit
import SnapKit

class AverageStarRatingView: UIView{
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var averageLabel: UILabel = {
        let label = UILabel()
        label.settingAverageLabel()
        return label
    }()
    
    private lazy var averageRating: UILabel = {
        let label = UILabel()
        label.settingRating()
        return label
    }()
    
    private lazy var starImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Star 1")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var starImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Star 1")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var starImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Star 1")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var starImageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Star 1")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var starImageView5: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Star 1")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
    private func configure() {
        
        self.addSubview(containerStackView)
        containerStackView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview()
        }
        
        [averageLabel,averageRating,starImageView1,starImageView2,starImageView3,starImageView4,starImageView5].forEach{
            containerStackView.addArrangedSubview($0)
        }
        
        [starImageView1,starImageView2,starImageView3,starImageView4,starImageView5].forEach{
            $0.snp.makeConstraints{ item in
                item.width.height.equalTo(20)
            }
        }
        
    }
   
    
}
