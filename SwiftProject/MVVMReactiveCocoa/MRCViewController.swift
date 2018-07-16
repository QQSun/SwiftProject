//
//  MRCViewController.swift
//  SwiftProject
//
//  Created by ReseBeta@WeShape on 2018/3/26.
//  Copyright © 2018年 WeShape3D. All rights reserved.
//

import UIKit

class MRCViewController: UIViewController {

    /// viewModel: 不允许赋值操作，只可读
    var viewModel: MRCViewModel!
    /// snapshot: 不允许赋值操作，只可读
    var snapshot: UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        addMainView()
    }

    
    
    required init(with viewModel: MRCViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MRCViewController {
    
    func bindViewModel() -> Void {}
    
    @discardableResult
    private func addMainView() -> Bool {
        let viewControllerString = NSStringFromClass(type(of: self))
        let viewString = viewControllerString.replacingOccurrences(of: "Controller", with: "")
        guard let Clazz = NSClassFromString(viewString) else { return false }
        guard let viewType = Clazz as? MRCView.Type else { return false }
        let view = viewType.init(with: self.viewModel)
        view.frame = self.view.bounds
        self.view.addSubview(view)
        return true
    }
}
