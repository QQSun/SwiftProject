//
//  AppDelegate.swift
//  SwiftProject
//
//  Created by ReseBeta@WeShape on 2018/3/26.
//  Copyright © 2018年 WeShape3D. All rights reserved.
//

import UIKit
import SHFullscreenPopGestureSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationControllerStack: WSNavigationControllerStack!
    var service: WSViewModelService!
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        SHFullscreenPopGesture.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        service = WSViewModelService()
        navigationControllerStack = WSNavigationControllerStack(with: service)
        service.resetRootViewController(by: createInitializeViewModel())
        
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}

extension AppDelegate {
    func createInitializeViewModel() -> WSViewModel {
        return WSLoginViewModel(with: service, with: nil)
//        return WSMainViewModel(with: self.service, with: nil)
    }
}

