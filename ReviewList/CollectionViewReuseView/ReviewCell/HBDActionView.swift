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
    
    private var heartDelegate: ReviewActionDelegate?
    private var heart: Bool? {
        didSet{
            heartButton.isSelect = self.heart!
        }
    }
    
    private var delclareDelegate: ReviewActionDelegate?
    
    private var reviewModel: ReviewCellModel?
    private var indexPath: IndexPath?
    
    func updateHeart(_ delegate: ReviewActionDelegate,_ indexPath: IndexPath, _ reviewModel: ReviewCellModel) {
        self.heart = reviewModel.heart
        self.heartDelegate = delegate
        self.delclareDelegate = delegate
        self.reviewModel = reviewModel
        self.indexPath = indexPath
    }
    
    lazy var heartButton: HeartButton = {
        let button = HeartButton()
        
        self.heart == true ?
        button.setBackgroundImage(UIImage(named: "heart.fill"), for: .normal)
        :
        button.setBackgroundImage(UIImage(named: "heart"), for: .normal)
        
        return button
    }()
    
    private lazy var heartCount: UILabel = {
        let label = UILabel()
        label.settingRating()
        label.text = 1200.toString()
        return label
    }()
    
    private lazy var bubleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFill
        button.setBackgroundImage(UIImage(named: "buble"), for: .normal)
        return button
    }()
    
    private lazy var bubleCount: UILabel = {
        let label = UILabel()
        label.settingRating()
        label.text = 1300.toString()
        return label
    }()
    
    private lazy var declareButton: UIButton = {
        let button = UIButton()
        button.tintColor = .lightGray
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "xmark.app"), for: .normal)
        if #available(iOS 13.0, *){
            button.setPreferredSymbolConfiguration(.init(pointSize: 30, weight: .regular, scale: .default), forImageIn: .normal)
        }
        
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
        stackView.spacing = 12
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var bubleStackView: UIStackView = {
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
        heartButton.addTarget(self, action: #selector(heartTapped(_ :)), for: .touchUpInside)
        declareButton.addTarget(self, action: #selector(declareButtonTapped(_ :)), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
    }
    @objc func declareButtonTapped(_ sender: UIButton){
        self.delclareDelegate?.declareTappedEvent(self.indexPath, self.reviewModel!)
    }
    
    @objc func heartTapped(_ sender: UIButton){
        
        heartCount.text = (1...3000).randomElement()!.toString()
        
        if heart != nil {
            self.heart?.toggle()
            let generator = UIImpactFeedbackGenerator(style: .soft)
            generator.impactOccurred()
            heartButton.isSelect = self.heart!
            self.reviewModel?.heart = heartButton.isSelect
            self.heartDelegate?.updateHeartPresent(self.indexPath, self.reviewModel)
        }
        
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
            $0.bottom.equalToSuperview()
        }
        
        [heartStackView,bubleStackView].forEach{
            self.heartBubleStackView.addArrangedSubview($0)
        }
        [heartButton,heartCount].forEach{
            self.heartStackView.addArrangedSubview($0)
        }
        heartButton.snp.makeConstraints{
            $0.height.width.equalTo(30)
        }
     
        [bubleButton,bubleCount].forEach{
            self.bubleStackView.addArrangedSubview($0)
        }
        
        bubleButton.snp.makeConstraints{
            $0.height.width.equalTo(30)
        }
        
        declareButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
        
        
    }
}
