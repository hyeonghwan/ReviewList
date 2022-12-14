//
//  ChangeLineButton.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/26.
//

import Foundation
import UIKit

class ChangeLineButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settingChangeLineButton()
        
    }
    func settingChangeLineButton() {
        self.frame = CGRect(x: 0, y: 0, width: 71, height: 16)
        self.setTitleColor(.label, for: .normal)
        self.titleLabel?.font = UIFont(name: "NanumGothic", size: 14)
        self.contentHorizontalAlignment = .trailing
        let attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: 0.07])
        self.setAttributedTitle(attributedText, for: .normal)
        
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        
    }
    
    
    func setTitle( line number: Int, count: Int, for state: UIControl.State){
        count <= 5 ? setTitle(count: count, for: .normal) : setButtonTitle(number)
    }
    func setTitle(count: Int, for state: UIControl.State){
        self.isHidden = true
    }
    
    func setButtonTitle(_ number: Int){
        number == 0 ? setTitle("줄이기", for: .normal) : setTitle("더보기", for: .normal)
    }
    
//    func setTitle( line number: Int, isTruncated: Bool?, for state: UIControl.State){
//        guard let isTruncated = isTruncated else {return}
//        if isTruncated == false {
//            self.setTitle("", for: .normal)
//        }else {
//            if number == 0 {
//                self.setTitle("줄이기", for: .normal)
//            }else{
//                self.setTitle("더보기", for: .normal)
//            }
//        }
//        
//    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
}
