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

//review Cell 이벤트 감지 프로토콜
protocol ReviewCellDelegate {
    func changeReviewContentLine(_ indexPath: IndexPath?,_ reviewModel: ReviewModel?)
    func updateHeartPresent(_ indexPath: IndexPath?, _ reviewModel: ReviewModel?)
}


class ViewController: UIViewController {
    
    let dummyProfileModel = ProfileModel(image: "profileImage", name: "ParkHyeongHwan", followingCount: 1250000, followerCount: 2500)
    var reviewModels = [ ReviewModel(lineFlag: false,content: "prakrkasfjkfal;"),ReviewModel(lineFlag: false), ReviewModel(lineFlag: false),ReviewModel(lineFlag: false),ReviewModel(lineFlag: false), ReviewModel(lineFlag: false),ReviewModel(lineFlag: false),ReviewModel(lineFlag: false), ReviewModel(lineFlag: false),ReviewModel(lineFlag: false),ReviewModel(lineFlag: false), ReviewModel(lineFlag: false),ReviewModel(lineFlag: false),ReviewModel(lineFlag: false), ReviewModel(lineFlag: false)]
    
    
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: ReviewCell.identify)
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.identify)
        collectionView.register(ReviewCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: ReviewCollectionViewHeader.identify)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.reloadData()
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if ViewSection(rawValue: indexPath.section) == .review{
            let reviewCell = ReviewCell()
            
            let width = collectionView.frame.size.width
            reviewCell.contentView.bounds.size.width = width
    
            reviewCell.calculateViewHeight( indexPath, reviewModels[indexPath.row])
            
            reviewCell.contentView.setNeedsLayout()
            reviewCell.contentView.layoutIfNeeded()
            
            // uiview.layoutFittingCompressedSize -> 뷰의 적절한 최소 크기 반환
            let height = reviewCell.contentView.systemLayoutSizeFitting(CGSize(width: width, height: UIView.layoutFittingCompressedSize.height)).height
            
            reviewCell.prepareForReuse()
            
            return CGSize(width: width, height: height)
        }
        return CGSize(width: self.view.frame.width, height: 300)
    }
}

extension ViewController: ReviewCellDelegate{
    func updateHeartPresent(_ indexPath: IndexPath?, _ reviewModel: ReviewModel?) {
        guard let index = indexPath else {print("updateHeartPresent indexPath error"); return}
        guard let reviewModel = reviewModel else {print("updateHeartPresent not error"); return}
        self.reviewModels[index.row] = reviewModel
    }
    
    
    func changeReviewContentLine(_ indexPath: IndexPath?,_ reviewModel: ReviewModel?) {
        guard let index = indexPath else {print("ReviewLineChangeDelegate indexPath error"); return}
        self.reviewModels[index.row] = reviewModel!
        collectionView.performBatchUpdates({}) { _ in
            self.collectionView.reloadItems(at: [index] )
//            self.collectionView.layoutIfNeeded()
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


extension UICollectionView {
    var widestCellWidth: CGFloat {
        let insets = contentInset.left + contentInset.right
        
        return bounds.width - insets
    }
}
