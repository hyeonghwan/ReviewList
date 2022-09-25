//
//  UIColor-ext.swift
//  ReviewList
//
//  Created by 박형환 on 2022/09/23.
//

import Foundation
import UIKit

infix operator |: AdditionPrecedence

extension UIColor {
        /// Easily define two colors for both light and dark mode.
        /// - Parameters:
        ///   - lightMode: The color to use in light mode.
        ///   - darkMode: The color to use in dark mode.
        /// - Returns: A dynamic color that uses both given colors respectively for the given user interface style.
        static func | (lightMode: UIColor, darkMode: UIColor) -> UIColor {
            guard #available(iOS 13.0, *) else { return lightMode }
            return UIColor { (traitCollection) -> UIColor in
                return traitCollection.userInterfaceStyle == .light ? lightMode : darkMode
            }
        }
}
