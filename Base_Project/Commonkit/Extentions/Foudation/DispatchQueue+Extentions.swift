//
//  DispatchQueue+Extentions.swift
//  Base_Project
//
//  Created by VietPT on 13/08/2021.
//

import Foundation

extension DispatchQueue {
    
    func asyncMainSafe(completion: @escaping () -> Void) {
        if Thread.isMainThread {
            completion()
        } else {
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func syncMainSafe(completion: @escaping () -> Void) {
        if Thread.isMainThread {
            completion()
        } else {
            DispatchQueue.main.sync {
                completion()
            }
        }
    }
}
