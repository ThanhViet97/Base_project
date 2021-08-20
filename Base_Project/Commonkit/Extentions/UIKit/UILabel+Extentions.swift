//
//  UILabel+Extentions.swift
//  Base_Project
//
//  Created by VietPT on 16/08/2021.
//

import UIKit

extension UILabel {
    
    func setUnderLine() {
        guard let text = self.text else { return }
        let attributes = NSMutableAttributedString(string: text)
        attributes.addAttribute(.underlineStyle, value: attributes, range: NSRange(location: 0, length: text.count))
        self.attributedText = attributes
    }
}
