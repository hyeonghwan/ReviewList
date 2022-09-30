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

/// review Cell 이벤트 감지 프로토콜
/// 1. 더보기
/// 2. heart action
/// 3. declare action
protocol ChangeLineDelegate  {
    func changeReviewContentLine(_ indexPath: IndexPath?,_ reviewModel: ReviewCellModel?)
}

protocol UpdateHeartPresent {
    func updateHeartPresent(_ indexPath: IndexPath?, _ reviewModel: ReviewCellModel?)
}


protocol DeclareEventProtocol {
    func declareTappedEvent(_ indexPath: IndexPath?,_ reviewModel: ReviewCellModel
    )
}


typealias ReviewActionDelegate = ChangeLineDelegate & UpdateHeartPresent & DeclareEventProtocol


class ViewController: UIViewController {
    
    let dummyProfileModel = ProfileModel(image: "profileImage",
                                         name: "Hwan",
                                         followingCount: 1250000,
                                         followerCount: 2500)
    
    let viewModel: ViewModelType
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.settingCollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    init(viewModel: ViewModelType = ViewModel()) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
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
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.leading.bottom.equalToSuperview()
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
                return CGSize(width: width, height: 80)
            default:
                assert(false, "headerInSection Error")
            }
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        
        switch ViewSection(rawValue: section){
        case .profile:
            return CGSize(width: width, height: 65)
        case .review:
            return CGSize()
        default:
            assert(false, "headerInSection Error")
        }
        
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if ViewSection(rawValue: indexPath.section) == .review{
            let reviewCell = ReviewCell()
            
            let width = collectionView.frame.size.width
            reviewCell.contentView.bounds.size.width = width
    
            reviewCell.calculateViewHeight( indexPath,
                                            viewModel.getCellData(indexPath.row))
            
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

extension ViewController: UpdateHeartPresent{
    func updateHeartPresent(_ indexPath: IndexPath?, _ reviewModel: ReviewCellModel?) {
        guard let index = indexPath else {print("updateHeartPresent indexPath error"); return}
        viewModel.updateCellData(index.row, reviewModel)
        self.collectionView.reloadData()
    }
}
    
extension ViewController: ChangeLineDelegate{
    
    func changeReviewContentLine(_ indexPath: IndexPath?,_ reviewModel: ReviewCellModel?) {
        guard let index = indexPath else {print("ReviewLineChangeDelegate indexPath error"); return}
        viewModel.updateCellData(index.row, reviewModel)
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.performBatchUpdates({}) { _ in
                self?.collectionView.reloadItems(at: [index] )
            }
        }
        
    }
}
extension ViewController: DeclareEventProtocol{
    
    func declareTappedEvent(_ indexPath: IndexPath?, _ reviewModel: ReviewCellModel) {
        let sheet = UIAlertController(title: "신고창", message: "신고하시겠습니까?\n\(reviewModel.reviewCellTitleData.storeTitleName)\n\(reviewModel.reviewCellTitleData.storeTitleRegion)", preferredStyle: .alert)
        sheet.addAction(UIAlertAction(title: "Yes!", style: .destructive, handler: { _ in print("yes 클릭") }))
                
        sheet.addAction(UIAlertAction(title: "No!", style: .cancel, handler: { _ in print("yes 클릭") }))
        present(sheet, animated: true)
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
            return viewModel.numberOfReviewCellData()
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ProfileStarRatingFooterView.identify, for: indexPath)
                return footerView
            
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ReviewCellHeaderView.identify, for: indexPath)
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
            cell.updateSettingUI(self,indexPath,viewModel.getCellData(indexPath.row))
            
            return cell
        default :
            assert(false,"error")
        }
    }
}

