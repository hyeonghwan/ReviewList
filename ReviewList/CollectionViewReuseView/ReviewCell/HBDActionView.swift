//
//  HBDActionView.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/24.
//

import Foundation
import UIKit
import SnapKit

class HBDActionView: UIView {
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "Heart"), for: .normal)
        return button
    }()
    
    private lazy var heartCount: UILabel = {
        let label = UILabel()
        label.settingRating()
        label.text = "23"
        return label
    }()
    
    private lazy var bubleButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "buble"), for: .normal)
        return button
    }()
    
    private lazy var bubleCount: UILabel = {
        let label = UILabel()
        label.settingRating()
        label.text = "0"
        return label
    }()
    
    private lazy var declareButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.tintColor = .white
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "xmark.app"), for: .normal)
        return button
    }()
    
    private lazy var heartBubleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 29
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var heartStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var bubleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
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
}

private extension HBDActionView {
    
    func configure() {
        self.backgroundColor = .clear
        self.addSubview(heartBubleStackView)
        
        self.addSubview(declareButton)
        
        heartBubleStackView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(25)
        }
        
        [heartStackView,bubleStackView].forEach{
            self.heartBubleStackView.addArrangedSubview($0)
        }
        [heartButton,heartCount].forEach{
            self.heartStackView.addArrangedSubview($0)
        }
        [bubleButton,bubleCount].forEach{
            self.bubleStackView.addArrangedSubview($0)
        }
        declareButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview().inset(15)
        }
        
    }
}
