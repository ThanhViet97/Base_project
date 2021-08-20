//
//  Containers.swift
//  Base_Project
//
//  Created by Phan Thanh Việt on 25/06/2021.
//

import Foundation

// MARK: Key Stores Using For UserDefault
struct KeyStored {
    static let theme = "Theme"
}

struct Containers {
    private static let createUserDefault = UserDefaults(suiteName: "\(AppHelpers.build)-default")
    
    static let userDefault = { () -> UserDefaults in
        guard let createUserDefault = Containers.createUserDefault else {
            return UserDefaults.standard
        }
        return createUserDefault
    }
    
    // Clear object store for key
    static func clearObjectFor(key: String) {
        Containers.userDefault().removeObject(forKey: key)
        Containers.userDefault().synchronize()
    }
    
    // Check Value Store For Key
    static func hashObjectFor(key: String) -> Bool {
      guard let _ = Containers.userDefault().object(forKey: key) else {
        return false
      }
      return true
    }
    
    // Clear user default
    static func clearUserDefault() {
        UserDefaults.standard.removePersistentDomain(forName: "\(AppHelpers.build)-default")
        UserDefaults.standard.synchronize()
    }
}


extension Containers {
    static func storeTheme(themeType: ThemeType) {
        Containers.userDefault().set(themeType.rawValue, forKey: KeyStored.theme)
    }
    
    static func takeTheme() -> ThemeType {
        return ThemeType(rawValue: Containers.userDefault().integer(forKey: KeyStored.theme)) ??  ThemeType.darkTheme
    }
}
