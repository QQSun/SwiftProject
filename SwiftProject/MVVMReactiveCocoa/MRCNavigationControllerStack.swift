//
//  MRCNavigationControllerStack.swift
//  SwiftProject
//
//  Created by ReseBeta@WeShape on 2018/3/26.
//  Copyright © 2018年 WeShape3D. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result
class MRCNavigationControllerStack: NSObject {

    var service: MRCViewModelService!
    lazy var navigationControllers: [MRCNavigationController] = {
        let navigationControllers = [MRCNavigationController]()
        return navigationControllers
    }()
    
    convenience init(with service: MRCViewModelService) {
        self.init()
        self.service = service
        registerNavigationHooks()
    }

    
}

extension MRCNavigationControllerStack {
    
    func push(with navigationController: MRCNavigationController) -> Void {
        if navigationControllers.contains(navigationController) {
            return
        }
        self.navigationControllers.append(navigationController)
    }
    
    func popNavigationController() -> MRCNavigationController? {
        let navigationController = navigationControllers.last
        navigationControllers.removeAll()
        return navigationController
    }
    
    func topNavigationController() -> MRCNavigationController? {
        return navigationControllers.last
    }
    
    func registerNavigationHooks() -> Void {
        /// pushViewController
        self.service.reactive.signal(for: #selector(MRCViewModelService.pushViewController(by:animated:))).observeValues { (action: [Any?]) in
            guard let topViewController = self.navigationControllers.first?.topViewController as? MRCViewController else { return }
            if let tabBarController = topViewController.tabBarController {
                topViewController.snapshot = tabBarController.view.snapshotView(afterScreenUpdates: false)
            } else {
                topViewController.snapshot = topViewController.view.snapshotView(afterScreenUpdates: false)
            }
            guard let viewController = MRCRouter.shareInstance.createViewController(for: action.first as! MRCViewModel) else { return }
            self.navigationControllers.last?.pushViewController(viewController, animated: action.last as! Bool)
        }
        /// popViewController
        self.service.reactive.signal(for: #selector(MRCViewModelService.popViewController(animated:))).observeValues { (action: [Any?]) in
            self.navigationControllers.last?.popViewController(animated: action.first as! Bool)
        }
        /// popToRootViewController
        self.service.reactive.signal(for: #selector(MRCViewModelService.popToRootViewController(animated:))).observeValues { (action: [Any?]) in
            self.navigationControllers.last?.popToRootViewController(animated: action.first as! Bool)
        }
        /// presentViewController
        self.service.reactive.signal(for: #selector(MRCViewModelService.presentViewController(by:animated:completion:))).observeValues { (action: [Any?]) in
            guard let viewController = MRCRouter.shareInstance.createNavigationController(for: action.first as! MRCViewModel) else { return }
            guard let presentViewController = self.navigationControllers.last else { return }
            
            self.push(with: viewController)
            presentViewController.present(viewController, animated: action[1] as! Bool, completion: action.last as? (() -> Void))
            
        }
        /// dismissViewController
        self.service.reactive.signal(for: #selector(MRCViewModelService.dismissViewController(animated:completion:))).observeValues { (action: [Any?]) in
            _ = self.popNavigationController()
            self.navigationControllers.last?.dismiss(animated: action.first as! Bool, completion: action.last as? (() -> Void))
        }
        
        /// resetRootViewController
        self.service.reactive.signal(for: #selector(MRCViewModelService.resetRootViewController(by:))).observeValues { (action: [Any?]) in
            guard let viewModel = action.first as? MRCViewModel else { return }
            self.navigationControllers.removeAll()
            guard let viewController = MRCRouter.shareInstance.createViewController(for: viewModel) else { return }
            if !viewController.isKind(of: MRCNavigationController.self) && !viewController.isKind(of: MRCTabBarController.self) {
                let navigationController = MRCNavigationController(rootViewController: viewController)
                self.push(with: navigationController)
                UIApplication.shared.delegate?.window??.rootViewController = navigationController
                return
            }
            UIApplication.shared.delegate?.window??.rootViewController = viewController
            
        }
    }
}
