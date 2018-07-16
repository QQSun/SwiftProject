//
//  MRCNavigationProtocol.swift
//  SwiftProject
//
//  Created by ReseBeta@WeShape on 2018/3/26.
//  Copyright © 2018年 WeShape3D. All rights reserved.
//

import Foundation

@objc protocol MRCNavigationProtocol: NSObjectProtocol {
    func pushViewController(by viewModel: MRCViewModel, animated: Bool)
    func popViewController(animated: Bool)
    func popToRootViewController(animated: Bool)
    func presentViewController(by viewModel: MRCViewModel, animated: Bool, completion: (() -> Void)?)
    func dismissViewController(animated: Bool, completion: (() -> Void)?)
    func resetRootViewController(by viewModel: MRCViewModel)
}

