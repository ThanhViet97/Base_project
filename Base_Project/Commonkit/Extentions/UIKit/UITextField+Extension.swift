//
//  UItextField+Extension.swift
//  Base_Project
//
//  Created by VietPT on 11/08/2021.
//

import UIKit

private var maxLengths = NSMapTable<UITextField, NSNumber>(keyOptions: .weakMemory, valueOptions: .strongMemory)

extension UITextField {
    
    var maxLength: Int? {
        get {
            return maxLengths.object(forKey: self)?.intValue
        }
        set {
            removeTarget(self, action: #selector(limitLength), for: .editingChanged)
            if let newValue = newValue {
                maxLengths.setObject(NSNumber(value: newValue), forKey: self)
                addTarget(self, action: #selector(limitLength), for: .editingChanged)
            } else {
                maxLengths.removeObject(forKey: self)
            }
        }
    }
    
    @IBInspectable var maxLengthInspectable: Int {
        get {
            return maxLength ?? Int.max
        }
        set {
            maxLength = newValue
        }
    }
    
    @objc private func limitLength(_ textField: UITextField) {
        guard let maxLength = maxLength, let prospectiveText = textField.text, prospectiveText.count > maxLength else {
            return
        }
        text = String((text ?? "").prefix(maxLength))
    }
}
