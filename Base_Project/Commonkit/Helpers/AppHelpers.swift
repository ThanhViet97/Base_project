//
//  AppHelpers.swift
//  Base_Project
//
//  Created by Phan Thanh Việt on 25/06/2021.
//

import UIKit

struct AppHelpers {
    /// Get AppDelegate (To use it, cast to AppDelegate with "as! AppDelegate")
    static weak var appDelegate: UIApplicationDelegate? = UIApplication.shared.delegate
    
    static let name: String = { return AppHelpers.string(forKey: "CFBundleDisplayName") }()
    static var version: String = { return AppHelpers.string(forKey: "CFBundleShortVersionString") }()
    static var build: String = { return AppHelpers.string(forKey: "CFBundleVersion") }()
    static var executable: String = { return AppHelpers.string(forKey: "CFBundleExecutable") }()
    static var bundle: String = { return AppHelpers.string(forKey: "CFBundleIdentifier") }()
    static var targetName: String = { return AppHelpers.string(forKey: "CFBundleName") }()
    
    static private func string(forKey key: String) -> String {
        guard let infoDictionary = Bundle.main.infoDictionary, let value = infoDictionary[key] as? String else { return "" }
        return value
    }
}
