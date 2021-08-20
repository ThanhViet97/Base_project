//
//  UIDevice+Extentions.swift
//  Base_Project
//
//  Created by VietPT on 13/08/2021.
//

import UIKit

extension UIDevice {
    
    enum ScreenType: String {
        case iPhone5Or5sOrSE
        case iPhone6Or6sOr7Or8
        case iPhone6PlusOr6sPlusOr7PlusOr8Plus
        case iPhoneXOrXS
        case iphoneXr
        case iphoneXsMax
        case unknown
    }
    
    var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 1136:
            return .iPhone5Or5sOrSE
        case 1334:
            return .iPhone6Or6sOr7Or8
        case 1920:
            return .iPhone6PlusOr6sPlusOr7PlusOr8Plus
        case 2436:
            return .iPhoneXOrXS
        case 1792:
            return .iphoneXr
        case 2688:
            return .iphoneXsMax
        default:
            return .unknown
        }
    }
}
