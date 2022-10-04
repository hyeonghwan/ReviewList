//
//  Int-ext.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/24.
//

import Foundation


extension Int {

    func toString() -> String {
        let result: String
        
        if self >= 1000 && self < 1000000{
    
            let value = (Double(self) / Double(1000))
            result = String(format: "%.1f", value) + "K"
            return result
            
        }else if self >= 1000000 {
            
            let value2 = (Double(self) / Double(1000000))
            result =  String(format: "%.1f", value2) + "M"
            return result
            
        }
        
        return String(self)
    }
    
    
}
