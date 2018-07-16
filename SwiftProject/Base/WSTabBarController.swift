//
//  WSTabBarController.swift
//  SwiftProject
//
//  Created by ReseBeta@WeShape on 2018/3/26.
//  Copyright © 2018年 WeShape3D. All rights reserved.
//

import UIKit

class WSTabBarController: MRCTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
}

extension WSTabBarController {
    
    func addChildViewControllers() -> WSTabBarController {
        addChildViewController(with: "WSProfileViewController", title: "我的", imageNamed: "")
        addChildViewController(with: "WSProfileViewController", title: "我的", imageNamed: "")
        addChildViewController(with: "WSProfileViewController", title: "我的", imageNamed: "")
        addChildViewController(with: "WSProfileViewController", title: "我的", imageNamed: "")
        return self
    }
    
    func addChildViewController(with controllerNamed: String, title: String, imageNamed: String) -> Void {
        guard let clazz = NSClassFromString("SwiftProject." + controllerNamed) else { return }
        guard let viewController = clazz as? UIViewController.Type else { return }
        let controller = viewController.init()
        controller.title = title
        controller.tabBarItem.image = UIImage(named: imageNamed)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = UIImage(named: imageNamed + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        let navigationController = WSNavigationController(rootViewController: controller)
        self.addChildViewController(navigationController)
        
    }
}
