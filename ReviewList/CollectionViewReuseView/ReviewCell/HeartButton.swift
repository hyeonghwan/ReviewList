//
//  File.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/26.
//

import Foundation
import UIKit

class HeartButton: UIButton {
    
    var isSelect: Bool = false{
        didSet{
            if isSelect == true{
                self.setBackgroundImage(UIImage(named: "heart.fill"), for: .normal)
            }else{
                self.setBackgroundImage(UIImage(named: "heart"), for: .normal)
            }
        }
    }
  
//    override var isSelected: Bool {
//        didSet{
//            print(self.isSelected)
//        }
//    }
//    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFit
        self.setBackgroundImage(UIImage(named: "heart"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
}
