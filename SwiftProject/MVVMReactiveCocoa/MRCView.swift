//
//  MRCView.swift
//  SwiftProject
//
//  Created by ReseBeta@WeShape on 2018/3/26.
//  Copyright © 2018年 WeShape3D. All rights reserved.
//

import UIKit

class MRCView: UIView {

    var viewModel: MRCViewModel!
    
   
    required init(with viewModel: MRCViewModel) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() -> Void {}
    
}
