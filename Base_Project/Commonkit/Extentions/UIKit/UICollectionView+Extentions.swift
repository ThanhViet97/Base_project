//
//  UICollectionView+Extentions.swift
//  Base_Project
//
//  Created by VietPT on 17/08/2021.
//

import UIKit

extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell> (cell: T.Type) {
        let nib = UINib(nibName: T.className, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.className)
    }
        
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let dequeueReusable = dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.className). Must register cell first")
        }
        return dequeueReusable
    }
    
    func reloadData(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0,
                       animations: { [weak self] in
                        self?.reloadData()
                       }, completion: { _ in
                        completion()
                       })
    }
    
    func reloadItem(item: Int, section: Int) {
        let indexPath = IndexPath(item: item, section: section)
        reloadItems(at: [indexPath])
    }
    
    func reloadSecsion(section: Int) {
        let indexSet = IndexSet(integer: section)
        reloadSections(indexSet)
    }
    
    func insertItem(item: Int, section: Int) {
        let indexPath = IndexPath(item: item, section: section)
        insertItems(at: [indexPath])
    }
    
    func deleteItem(item: Int, section: Int) {
        let indexPath = IndexPath(item: item, section: section)
        deleteItems(at: [indexPath])
    }
    
    func addRefreshControl(refreshControl: UIRefreshControl) {
        if #available(iOS 10.0, *) {
            self.addRefreshControl(refreshControl: refreshControl)
        } else {
            self.addSubview(refreshControl)
        }
    }
}
