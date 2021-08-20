//
//  UINavigationController+Extentions.swift
//  Base_Project
//
//  Created by VietPT on 19/08/2021.
//

import UIKit

extension UINavigationController {
    
    func pushViewController(_ viewController: UIViewController, animation: Bool, completion: (() -> Void)? = nil) {
        doInTransaction(block: {
            pushViewController(viewController, animated: animation)
        }, {
            completion?()
        })
    }
    
    func popViewController(competion: (() -> Void)? = nil) {
        doInTransaction(block: {
            popViewController()
        }, {
            competion?()
        })
    }
    
    private func doInTransaction(block: () -> (), _ completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        block()
        CATransaction.commit()
    }
}
