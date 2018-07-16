//
//  WSLoginView.swift
//  SwiftProject
//
//  Created by ReseBeta@WeShape on 2018/3/29.
//  Copyright © 2018年 WeShape3D. All rights reserved.
//

import UIKit
import ReactiveCocoa
import MJRefresh
class WSLoginView: WSView {

    lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("登录", for: .normal)
        loginButton.setTitleColor(.green, for: .normal)
        loginButton.reactive.pressed = CocoaAction((viewModel as! WSLoginViewModel).commit, input: loginButton)
        return loginButton
    }()
    
    
    override func initialize() {
        loginButton.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        addSubview(loginButton)
    }

}
