//
//  UILabel-ext.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/23.
//

import Foundation
import UIKit


extension UILabel {
    
    func calculateMaxLines(_ frame: CGSize) -> Int {
        let maxSize = frame
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin, .usesFontLeading],
                                         attributes: [NSAttributedString.Key.font: font!], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
    
    func settingNameLabel() {
        self.backgroundColor = .clear
        self.textColor = .label
        self.font = UIFont(name: "NanumGothicBold", size: 20)
        self.attributedText = NSMutableAttributedString(string: "",
                                                        attributes: [NSAttributedString.Key.kern : 0.1])
    }
    
    func settingFollowLabel() {
        self.backgroundColor = .clear
        self.textColor = .label
        self.font = UIFont.init(name: "NanumGothicBold", size: 16)
        self.attributedText = NSMutableAttributedString(string: "",
                                                        attributes: [NSAttributedString.Key.kern : 0.08])
    }
    
    func settingIntroduceLabel() {
        
        self.backgroundColor = .clear
        self.textColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1) | UIColor.label
        self.font = UIFont.boldSystemFont(ofSize: 16)
        self.numberOfLines = 1
        // Line height: 18 pt

        self.attributedText = NSMutableAttributedString(string: "빡코딩으로빡코딩으로빡코딩으로빡코딩으로빡코딩으로", attributes: [NSAttributedString.Key.kern: 0.08])
    }
    
    func settingAverageLabel() {
       
        self.backgroundColor = .clear
        self.textColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1) | UIColor.label
        self.font = UIFont(name: "NanumGothic", size: 16)

        self.attributedText = NSMutableAttributedString(string: "평균 별점", attributes: [NSAttributedString.Key.kern: 0.08])
    }
    
    func settingRating() {
        
        self.backgroundColor = .clear
        self.textColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1) | UIColor.label
        self.font = UIFont(name: "NanumGothicBold", size: 16)
        self.attributedText = NSMutableAttributedString(string: "4.7", attributes: [NSAttributedString.Key.kern: 0.08])
    }
    
    func settingReviewTitle(){
        
        self.backgroundColor = .clear
        self.textColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1) | UIColor.label
        self.font = UIFont(name: "NanumGothicBold", size: 14)
        self.attributedText = NSMutableAttributedString(string: "너무 너무 맛있어요!너무 너무 맛있어요너무 너무 맛있어요너무 너무 맛있어요", attributes: [NSAttributedString.Key.kern: 0.07])
    }
    
    func settingReviewContent() {
       
        self.backgroundColor = .clear
        
        self.textColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1) | UIColor.label
        self.font = UIFont(name: "NanumGothic", size: 12)
        self.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.32
        self.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: 0.06, NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    
    
}


//NanumGothic
//NanumGothicBold
//NanumGothicExtraBold
