//
//  ViewController.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
  
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = CustomLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
//        layout.estimatedItemSize = CGSize(width: self.view.frame.width, height: 300)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: ReviewCell.identify)
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.identify)
//        collectionView.register(ReviewCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: ReviewCollectionViewHeader.identify)
        
        //test
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
//    private lazy var profileView: ProfileView = {
//       let view = ProfileView()
//        return view
//    }()
//
//    private lazy var separatorLine: SeparatorLine = {
//       let view = SeparatorLine()
//        return view
//    }()
//
//
//    private lazy var ratingView: AverageStarRatingView = {
//        let view = AverageStarRatingView()
//        return view
//    }()
//
//    private lazy var separatorLine2: SeparatorLine = {
//       let view = SeparatorLine()
//        return view
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        collectionView.reloadData()
        configure()
    }


}
private extension ViewController{
    func configure() {
        
        self.view.addSubview(collectionView)
        
//        [profileView,separatorLine,ratingView,separatorLine2].forEach{
//            self.collectionView.addSubview($0)
//        }
        
//        profileView.snp.makeConstraints{
//            $0.top.leading.trailing.equalToSuperview()
//            $0.height.equalTo(350)
//        }
//        separatorLine.snp.makeConstraints{
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(8)
//            $0.top.equalTo(profileView.snp.bottom).offset(23)
//        }
//        ratingView.snp.makeConstraints{
//            $0.top.equalTo(separatorLine.snp.bottom)
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(60)
//        }
//        separatorLine2.snp.makeConstraints{
//            $0.height.equalTo(8)
//            $0.top.equalTo(ratingView.snp.bottom)
//            $0.leading.trailing.equalToSuperview()
//        }
//
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        collectionView.backgroundColor = .systemCyan
        
    }
}
//extension ViewController: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        if indexPath.section == 1{
//            return CGSize(width: UIScreen.main.bounds.width, height: 600)
//        }
//        return CGSize(width: UIScreen.main.bounds.width, height: 350)
//
//    }
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
////        let width = UIScreen.main.bounds.width
////
////        return CGSize(width: width, height: 100)
////    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
extension ViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.section == 0{
            
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identify, for: indexPath) as? ProfileCell else {print("profile cell nil"); return UICollectionViewCell()}
            
            return cell
            
        }else {
            
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCell.identify, for: indexPath) as? ReviewCell else {print("profile cell nil"); return UICollectionViewCell()}
            
            return cell
        }
            
        
    }
}
