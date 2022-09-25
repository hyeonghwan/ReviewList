//
//  UILabel-ext.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/23.
//

import Foundation
import UIKit


extension UILabel {
    
    func calculateMaxLines() -> Int {
        
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin,
                                         attributes: [NSAttributedString.Key.font: font], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
        }
    
    var maxNumberOfLines: Int {
           let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
           let text = (self.text ?? "") as NSString
           let textHeight = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil).height
           let lineHeight = font.lineHeight
           return Int(ceil(textHeight / lineHeight))
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

        // Line height: 18 pt

        self.attributedText = NSMutableAttributedString(string: "빡코딩으로 세계정복", attributes: [NSAttributedString.Key.kern: 0.08])
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
        self.attributedText = NSMutableAttributedString(string: "너무 너무 맛없", attributes: [NSAttributedString.Key.kern: 0.07])
    }
    func settingReviewContent() {
       
        self.backgroundColor = .clear

        self.textColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1) | UIColor.label
        self.font = UIFont(name: "NanumGothic", size: 12)
        self.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.32
        self.attributedText = NSMutableAttributedString(string: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,", attributes: [NSAttributedString.Key.kern: 0.06, NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    
    
}


//NanumGothic
//NanumGothicBold
//NanumGothicExtraBold
