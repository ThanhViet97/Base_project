//
//  String+Extentions.swift
//  Base_Project
//
//  Created by VietPT on 20/08/2021.
//

import Foundation

extension String {
    
    mutating func trim() {
        self = self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    
}
