//
//  UITableView+Extentions.swift
//  Base_Project
//
//  Created by VietPT on 16/08/2021.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(cell: T.Type) {
        let nib = UINib(nibName: T.className, bundle: nil)
        register(nib, forCellReuseIdentifier: T.className)
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(cell: T.Type) {
        let nib = UINib(nibName: T.className, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: T.className)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.className). Must register cell first")
        }
        return cell
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.className) as? T else {
            fatalError("Could not dequeue view with identifier: \(T.className). Must register cell first")
        }
        return view
    }
    
    func addRefreshControl(refreshControl: UIRefreshControl) {
        if #available(iOS 10.0, *) {
            self.refreshControl = refreshControl
        } else {
            self.addSubview(refreshControl)
        }
    }
    
    func resizeCellWhenEditing() {
        UIView.setAnimationsEnabled(false)
        self.beginUpdates()
        self.endUpdates()
        UIView.setAnimationsEnabled(true)
    }
    
    func reloadRow(row: Int, section: Int, with animation: RowAnimation = .none) {
        let indexPath = IndexPath(row: row, section: section)
        reloadRows(at: [indexPath], with: animation)
    }
    
    func releadSection(section: Int, with animation: RowAnimation = .none) {
        reloadSections(IndexSet(integer: section), with: animation)
    }
    
    func inseartRow(row: Int, section: Int, with animation: RowAnimation = .none) {
        let indexPath = IndexPath(row: row, section: section)
        insertRows(at: [indexPath], with: animation)
    }
    
    func deleteRow(row: Int, section: Int, with animation: RowAnimation = .none) {
        let indexPath = IndexPath(row: row, section: section)
        deleteRows(at: [indexPath], with: animation)
    }
    
    func reloadData(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0,
                       animations: { [weak self] in
                        self?.reloadData()
                       }, completion: {_ in
                        completion()
                       })
    }
}
