//
//  MRCRouter.swift
//  SwiftProject
//
//  Created by ReseBeta@WeShape on 2018/3/27.
//  Copyright © 2018年 WeShape3D. All rights reserved.
//

import UIKit

class MRCRouter: NSObject {

    static let shareInstance = MRCRouter()
    private override init() {}
    
}

extension MRCRouter {
    
    func createViewController(for viewModel: MRCViewModel) -> MRCViewController? {
        let viewModelTypeString = NSStringFromClass(type(of: viewModel))
        let viewControllerTypeString = viewModelTypeString.replacingOccurrences(of: "Model", with: "Controller")
        guard let clazz = NSClassFromString(viewControllerTypeString) else { return nil }
        guard let viewControllerType = clazz as? MRCViewController.Type else { return nil }
        let viewController = viewControllerType.init(with: viewModel)
        viewController.title = viewModel.title
        return viewController
    }
    
    func createNavigationController(for viewModel: MRCViewModel) -> MRCNavigationController? {
        guard let viewController = createViewController(for: viewModel) else { return nil }
        return MRCNavigationController(rootViewController: viewController)
    }
    
}
