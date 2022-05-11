//
//  ViewController.swift
//  localPersist
//
//  Created by Rave Bizz on 5/11/22.
//

import UIKit
///
/// 1. UserDefaults: user preferences, color theme, dark mode, default options
/// 2. FileManager: documents, music, pictures (as file)
/// 3. CoreData: access a database
/// 4. KeyChain: sensitive data, tokens, passwork, api Keys

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIAlertAction()
        UIAlertController()

    }
    
    func saveToUserDefaults() {
        UserDefaults.standard.setValue("purple", forKey: UserDefaultKeys.colorTheme.rawValue)
        UserDefaults.standard.setValue("true", forKey: UserDefaultKeys.darkMode.rawValue)
    }
    
    func loadFromUserDefaults() {
        let theme = UserDefaults.standard.value(forKey: UserDefaultKeys.colorTheme.rawValue)
        print(theme ?? "")
        let screenMode = UserDefaults.standard.value(forKey: UserDefaultKeys.darkMode.rawValue)
    }
    
    enum UserDefaultKeys: String {
        case colorTheme, darkMode
    }
    
    struct MusicItem: Codable {
        let name: String
    }
    
    func saveToFile(musicItems: [MusicItem]) {
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = FileManager.default.urls(for: cacheDirectory, in: .userDomainMask)
        
        guard let fileURL = folderURLs.first?.appendingPathComponent("music") else { return }
                
        guard let data = try? JSONEncoder().encode(musicItems) else {
            return
        }
        try? data.write(to: fileURL, options: .atomicWrite)

    }
    
    func loadDataFromDisk() -> [MusicItem]? {
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = FileManager.default.urls(for: cacheDirectory, in: .userDomainMask)
        
        guard let fileURL = folderURLs.first?.appendingPathComponent("music") else { fatalError() }
        
        if let data = FileManager.default.contents(atPath: fileURL.path) {
            if let lastInput = try? JSONDecoder().decode([MusicItem].self, from: data) {
                return lastInput
            }
        }
        return nil
    }

}
