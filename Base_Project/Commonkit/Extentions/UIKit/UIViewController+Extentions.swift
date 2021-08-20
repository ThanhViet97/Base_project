//
//  UIViewController+Extentions.swift
//  Base_Project
//
//  Created by VietPT on 18/08/2021.
//

import UIKit

extension UIViewController {
    
    func addNotificationObsever(name: Notification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }
    
    func removeNotificationObserver(name: Notification.Name) {
        NotificationCenter.default.removeObserver(self, name: name, object: nil)
    }
    
    func removeNotificationObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func addChildViewController(_ childController: UIViewController, to containerView: UIView) {
        addChild(childController)
        containerView.addSubview(childController.view)
        childController.didMove(toParent: self)
    }
    
    func removeChildViewController() {
        guard parent != nil else { return }
        willMove(toParent: self)
        removeFromParent()
        view.removeFromSuperview()
    }
}
