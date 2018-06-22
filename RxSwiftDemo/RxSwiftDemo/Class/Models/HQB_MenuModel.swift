//
//  HQB_MenuModel.swift
//  RxSwiftDemo
//
//  Created by Harry.huang on 2018/6/15.
//  Copyright © 2018年 黄启博. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

struct HQB_MenuModel {
    let meunTitle: String
}

struct HQB_MenuSection {
    var hearder:String
    var items: [Item]
}

extension HQB_MenuSection: AnimatableSectionModelType {
    typealias Item = String
    
    var identity: String {
        return hearder
    }
    
    init(original: HQB_MenuSection, items: [Item]) {
        self = original
        self.items = items
    }
}

