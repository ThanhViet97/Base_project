//
//  NSObject+Extention.swift
//  Base_Project
//
//  Created by VietPT on 16/08/2021.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: type(of: self))
    }
}
