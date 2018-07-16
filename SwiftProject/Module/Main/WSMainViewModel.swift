//
//  WSMainViewModel.swift
//  SwiftProject
//
//  Created by ReseBeta@WeShape on 2018/3/26.
//  Copyright © 2018年 WeShape3D. All rights reserved.
//

import UIKit

class WSMainViewModel: WSViewModel {

    lazy var discoverViewModel: WSDiscoverViewModel = { [unowned self] in
        let discoverViewModel = WSDiscoverViewModel(with: self.service, with: nil)
        return discoverViewModel
    }()
    
    lazy var h6ViewModel: WSH6ViewModel = { [unowned self] in
        let h6ViewModel = WSH6ViewModel(with: self.service, with: nil)
        return h6ViewModel
    }()
    
    lazy var businessViewModel: WSBusinessViewModel = { [unowned self] in
        let businessViewModel = WSBusinessViewModel(with: self.service, with: nil)
        return businessViewModel
    }()
    
    lazy var profileViewModel: WSProfileViewModel = { [unowned self] in
        let profileViewModel = WSProfileViewModel(with: self.service, with: nil)
        return profileViewModel
    }()
    
}

