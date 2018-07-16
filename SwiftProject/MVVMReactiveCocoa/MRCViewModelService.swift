//
//  MRCViewModelService.swift
//  SwiftProject
//
//  Created by ReseBeta@WeShape on 2018/3/26.
//  Copyright © 2018年 WeShape3D. All rights reserved.
//

import Foundation

class MRCViewModelService: NSObject {

}

extension MRCViewModelService: MRCNavigationProtocol {
    @objc func pushViewController(by viewModel: MRCViewModel, animated: Bool){}
    @objc func popViewController(animated: Bool){}
    @objc func popToRootViewController(animated: Bool){}
    @objc func presentViewController(by viewModel: MRCViewModel, animated: Bool, completion: (() -> Void)?){}
    @objc func dismissViewController(animated: Bool, completion: (() -> Void)?){}
    @objc func resetRootViewController(by viewModel: MRCViewModel){}
}


