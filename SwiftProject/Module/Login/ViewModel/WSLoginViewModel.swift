//
//  WSLoginViewModel.swift
//  SwiftProject
//
//  Created by ReseBeta@WeShape on 2018/3/27.
//  Copyright © 2018年 WeShape3D. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result
class WSLoginViewModel: WSViewModel {
    
    lazy var commit: Action<UIButton, Bool, NoError> = { [unowned self] in
        
        let commit = Action(enabledIf: Property(value: true)) { (button: UIButton) -> SignalProducer<Bool, NoError> in
            print(button)
            
            let viewModel = WSLoginViewModel(with: self.service, with: nil)
            self.service.pushViewController(by: viewModel, animated: true)
            
            return SignalProducer.empty
        }
        return commit
    }()
    
    override func initialize() {
        title = "登录"
        
    }
    
}
