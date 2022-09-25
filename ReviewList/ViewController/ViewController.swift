//
//  ViewController.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/22.
//

import UIKit
import SnapKit


//화면에 보여질 Cell 종류 enum 값 (profileCell,ReviewCell)
enum ViewSection : Int{
    case profile = 0
    case review = 1
}

protocol ReviewLineChangeDelegate {
    func changeReviewContentLine(_ indexPath: IndexPath?,_ reviewModel: ReviewModel?)
}


class ViewController: UIViewController {
    
    let dummyProfileModel = ProfileModel(image: "profileImage", name: "ParkHyeongHwan", followingCount: 1250000, followerCount: 2500)
    var reviewModels = [ReviewModel(lineFlag: false), ReviewModel(lineFlag: false)]
    
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
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
            
            switch ViewSection(rawValue: section){
            case .profile:
                return CGSize()
            case .review:
                return CGSize(width: width, height: 120)
            default:
                assert(false, "headerInSection Error")
            }
        }
}

extension ViewController: ReviewLineChangeDelegate{
    
    func changeReviewContentLine(_ indexPath: IndexPath?,_ reviewModel: ReviewModel?) {
        guard let index = indexPath else {print("ReviewLineChangeDelegate indexPath error"); return}
        self.reviewModels[index.row] = reviewModel!
//        self.collectionView.collectionViewLayout.invalidateLayout()
//        self.collectionView.reloadData()
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
        
        //section은 Profile Section, ReviewList Section
        switch ViewSection(rawValue: section) {
        case .profile:
            return 1
        case .review:
            return reviewModels.count
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
      
        switch ViewSection(rawValue: indexPath.section){
            
        case .profile:
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identify, for: indexPath) as? ProfileCell else {print("profile cell nil"); return UICollectionViewCell()}
            cell.updateCellComponent(dummyProfileModel)
            
            return cell
            
        case .review:
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCell.identify, for: indexPath) as? ReviewCell else {print("review cell nil"); return UICollectionViewCell()}
            cell.updateSettingUI(self,indexPath,reviewModels[indexPath.row])
            
            return cell
        default :
            assert(false,"error")
        }
    }
}
