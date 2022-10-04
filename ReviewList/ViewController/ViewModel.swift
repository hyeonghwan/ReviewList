//
//  ViewModel.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/28.
//

import Foundation
import RxSwift

protocol ViewModelType{
//    var
    func numberOfReviewCellData() -> Int
    
    var cellReload: (() -> Void)? { get }
    
    func getCellData(_ index: Int) -> ReviewCellModel
    
    func updateCellData(_ index: Int,_ reviewModel: ReviewCellModel?)
}


class ViewModel: ViewModelType{
    
    private var dummyCellData: [ReviewCellModel] = ReviewCellDummy.dummyReviewCellModel
    
    var cellReload: (() -> Void)? {
        didSet{
            cellReload?()
        }
    }
    
    init(){}
    
    func numberOfReviewCellData() -> Int {
        return dummyCellData.count
    }
    
    func getCellData(_ index: Int) -> ReviewCellModel {
        return dummyCellData[index]
    }
    
    func updateCellData(_ index: Int,_ reviewModel: ReviewCellModel?){
        reviewModel != nil ? self.dummyCellData[index] = reviewModel! : print("reviewModel nil")
    }
    
}
