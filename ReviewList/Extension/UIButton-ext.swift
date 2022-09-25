//
//  UIButton-ext.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/23.
//

import Foundation
import UIKit

extension UIButton {
    
    func settingFollowButton() {
        self.frame = CGRect(x: 0, y: 0, width: 341, height: 38)
        self.backgroundColor = .white
        self.titleLabel?.textAlignment = .center
        let att = NSAttributedString(string: "팔로우",
                                     attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
                                                  NSAttributedString.Key.foregroundColor : UIColor(red: 1, green: 1, blue: 1, alpha: 1 )])
        self.setAttributedTitle(att, for: .normal)
        self.layer.backgroundColor = UIColor(red: 0.879, green: 0.223, blue: 0.42, alpha: 1).cgColor
        self.layer.cornerRadius = 16
    }
    
    func settingChangeLineButton() {
        self.frame = CGRect(x: 0, y: 0, width: 71, height: 16)
        self.backgroundColor = .clear

        self.tintColor = UIColor(red: 0.425, green: 0.391, blue: 0.391, alpha: 1) | UIColor.systemGray6
        self.titleLabel?.font = UIFont(name: "NanumGothic", size: 14)

        let attributedText = NSMutableAttributedString(string: "줄여서 보기", attributes: [NSAttributedString.Key.kern: 0.07])
        self.setAttributedTitle(attributedText, for: .normal)
        
        let attributedText2 = NSMutableAttributedString(string: "더보기", attributes: [NSAttributedString.Key.kern: 0.07])
        self.setAttributedTitle(attributedText2, for: .normal)
    }
    
   
    
    func settingBubbleButton() {
        
    }
    
    func settingDeclareButton() {
        
    }
    
    
}
