//
//  ViewController.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
  
    let dummyModel = ProfileModel(image: "profileImage", name: "ParkHyeongHwan", followingCount: 101, followerCount: 101)
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
            flowLayout.estimatedItemSize = CGSize(width: (UIScreen.main.bounds.width), height: 2000)
            flowLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: ReviewCell.identify)
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.identify)
        collectionView.register(ReviewCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: ReviewCollectionViewHeader.identify)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
        
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
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            let width = UIScreen.main.bounds.width
            if section == 1{
                return CGSize(width: width, height: 120)
            }else {
                return CGSize()
            }
        }
}

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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ReviewCollectionViewHeader.identify, for: indexPath)
                return headerView
        default:
            assert(false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.section == 0{
            
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identify, for: indexPath) as? ProfileCell else {print("profile cell nil"); return UICollectionViewCell()}
            cell.updateCellComponent(dummyModel)
            return cell
            
        }else {
            
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCell.identify, for: indexPath) as? ReviewCell else {print("profile cell nil"); return UICollectionViewCell()}
            
            return cell
        }
            
        
    }
}
