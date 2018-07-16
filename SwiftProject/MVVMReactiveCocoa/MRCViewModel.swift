//
//  MRCViewModel.swift
//  SwiftProject
//
//  Created by ReseBeta@WeShape on 2018/3/26.
//  Copyright © 2018年 WeShape3D. All rights reserved.
//

import UIKit
import ReactiveCocoa
class MRCViewModel: NSObject {

    var service: MRCViewModelService!
    var param: [String : AnyObject]?
    var title: String?
    
    
    convenience init(with service: MRCViewModelService, with param: [String : AnyObject]?) {
        self.init()
        self.service = service
        self.param = param
        initialize()
    }
    
    func initialize() -> Void {}
}

extension MRCViewModel {
    

}
