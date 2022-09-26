//
//  ReviewModel.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/25.
//

import Foundation


struct ReviewModel {
    var lineFlag: Bool
    var content: String = "Lorem ipsum doloDonec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,Lorem ipsum doloDonec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,Lorem ipsum doloDonec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,Lorem ipsum doloDonec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,Lorem ipsum doloDonec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,Lorem ipsum doloDonec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,Lorem ipsum doloDonec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,Lorem ipsum doloDonec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,Lorem ipsum doloDonec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,Lorem ipsum doloDonec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,"
    var heart: Bool = false
    
    init(lineFlag: Bool, content: String) {
        self.lineFlag = lineFlag
        self.content = content
    }
    init(lineFlag: Bool) {
        self.lineFlag = lineFlag
    }
//    let image: String
//    let name: String
//    let introduce: String
}
