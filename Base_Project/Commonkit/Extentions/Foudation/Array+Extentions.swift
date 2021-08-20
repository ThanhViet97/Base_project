//
//  Array+Extentions.swift
//  Base_Project
//
//  Created by VietPT on 12/08/2021.
//

import Foundation

extension Array {
    
    func notContains(where predicate: (Element) throws -> Bool) rethrows -> Bool {
        for item in self {
            if try predicate(item) {
                return false
            }
        }
        return true
    }
    
    func element(at index: Int) -> Element? {
        guard index >= 0 && index < self.count else { return nil}
        return self[index]
    }
    
    func lastIndex() -> Int? {
        let index = self.count - 1
        return index < 0 ? nil : index
    }
    
    func isNotEmpty() -> Bool {
        return !self.isEmpty
    }
}

extension Array where Element: Hashable {
    
    func isDifference(from other: [Element]) -> Bool {
        let currentSet = Set(self)
        let otherSet = Set(other)
        return !Array(currentSet.symmetricDifference(otherSet)).isEmpty
    }
    
    // Removing duplicate elements
    func uniqueElements() -> [Element] {
        var seen = Set<Element>()
        return filter({ seen.insert($0).inserted })
    }
}
