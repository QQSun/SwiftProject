//
//  WSMainViewController.swift
//  SwiftProject
//
//  Created by ReseBeta@WeShape on 2018/3/26.
//  Copyright © 2018年 WeShape3D. All rights reserved.
//

import UIKit

class WSMainViewController: WSTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tabBarController.delegate = self
        let discover = addNavigationController(for: (self.viewModel as! WSMainViewModel).discoverViewModel)
        _ = addNavigationController(for: (self.viewModel as! WSMainViewModel).h6ViewModel)
        _ = addNavigationController(for: (self.viewModel as! WSMainViewModel).businessViewModel)
        _ = addNavigationController(for: (self.viewModel as! WSMainViewModel).profileViewModel)
        (UIApplication.shared.delegate as! AppDelegate).navigationControllerStack.push(with: discover)
    }

}

extension WSTabBarController {
    
    func addNavigationController(for viewModel: WSViewModel) -> WSNavigationController {
        
        let viewController = WSRouter.shareInstance.createViewController(for: viewModel)!
        let navigationController = WSNavigationController(rootViewController: viewController)
        tabBarController.addChildViewController(navigationController)
        return navigationController
    }
}

// MARK: - UITabBarControllerDelegate
extension WSTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        _ = (UIApplication.shared.delegate as! AppDelegate).navigationControllerStack.popNavigationController()
        (UIApplication.shared.delegate as! AppDelegate).navigationControllerStack.push(with: viewController as! WSNavigationController)
    }
}

