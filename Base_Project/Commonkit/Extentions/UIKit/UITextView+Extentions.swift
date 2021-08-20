//
//  UITextView+Extentions.swift
//  Base_Project
//
//  Created by VietPT on 18/08/2021.
//

import UIKit

extension UITextView {
    
    func scrollToBottom() {
        let range = NSMakeRange(self.text.count - 1, 1)
        self.scrollRangeToVisible(range)
    }
    
    func scrollToTop() {
        let range = NSMakeRange(0, 1)
        self.scrollRangeToVisible(range)
    }
    
    func clear() {
        self.text = ""
        self.attributedText = NSAttributedString(string: "")
    }
}
