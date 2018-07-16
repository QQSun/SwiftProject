//
//  MRCTabBarController.swift
//  SwiftProject
//
//  Created by ReseBeta@WeShape on 2018/3/26.
//  Copyright © 2018年 WeShape3D. All rights reserved.
//

import UIKit

class MRCTabBarController: MRCViewController {
    
    lazy override var tabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        return tabBarController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabBarController.view)
        addChildViewController(tabBarController)
        tabBarController.didMove(toParentViewController: self)

    }
}

extension MRCTabBarController {
    
    override var shouldAutorotate: Bool {
        guard let shouldAutorotate = tabBarController.selectedViewController?.shouldAutorotate else {
            return super.shouldAutorotate
        }
        return shouldAutorotate
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let orientations = tabBarController.selectedViewController?.supportedInterfaceOrientations else { return super.supportedInterfaceOrientations }
        return orientations
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let style = tabBarController.selectedViewController?.preferredStatusBarStyle else { return super.preferredStatusBarStyle }
        return style
    }
    
    override var prefersStatusBarHidden: Bool {
        guard let hidden = tabBarController.selectedViewController?.prefersStatusBarHidden else { return super.prefersStatusBarHidden }
        return hidden
    }
    
}
