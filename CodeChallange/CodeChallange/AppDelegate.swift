//
//  AppDelegate.swift
//  CodeChallange
//
//  Created by Kai-Marcel Teuber on 16.09.19.
//  Copyright © 2019 App-Developers.de. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - init
    
    // MARK: - overrides
    
    // MARK: - Protocol UIApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // we need to move this to a delay or app gets killed if things take to long
        setupComponents()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ApplicationFlow(userController: userController, networkingProvider: networkingProvider, favoritesProvider: favoritesProvider)
        self.window?.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        favoritesProvider.save()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - public
    
    var window: UIWindow?

    // MARK: - private
    
    private var applicationFlow: ApplicationFlow!
    private var userController: UserController!

    private var networkingProvider: Networking!
    private var favoritesProvider: Favorites!
    
    private func setupComponents() {
        self.userController = UserController()
        self.networkingProvider = Networking(webservice: WebService(), userController: userController)
        let storage = FileStorage(filename: "favorites.json")
        self.favoritesProvider = Favorites(storage: storage)
    }
//        let jsonDecoder = JSONDecoder()
//        if let data = loadFavoritesData(),
//            let posts = try? jsonDecoder.decode([Post].self, from: data) {
//            self.favoritesProvider = Favorites(favorites: posts)
//        } else {
//            self.favoritesProvider = Favorites(favorites: [])
//        }
//    }
//
//    private func loadFavoritesData() -> Data? {
//        guard var documentsFolder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
//            fatalError()
//        }
//
//        documentsFolder.appendPathComponent("favorites.json")
//        return FileManager.default.contents(atPath: documentsFolder.path)
//    }
//
//    private func saveFavoritesData() {
//        guard var documentsFolder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
//            fatalError()
//        }
//
//        if !FileManager.default.fileExists(atPath: documentsFolder.path) {
//            do {
//                try FileManager.default.createDirectory(at: documentsFolder, withIntermediateDirectories: false, attributes: nil)
//            }
//            catch {
//                fatalError()
//            }
//        }
//
//        documentsFolder.appendPathComponent("favorites.json")
//
//        if let data = favoritesProvider.jsonData() {
//            FileManager.default.createFile(atPath: documentsFolder.path, contents: data, attributes: nil)
//        }
//
//    }


}

