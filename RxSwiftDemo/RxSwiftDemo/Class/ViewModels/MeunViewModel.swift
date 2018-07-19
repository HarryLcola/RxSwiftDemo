//
//  MeunViewModel.swift
//  RxSwiftDemo
//
//  Created by Harry.huang on 2018/6/15.
//  Copyright © 2018年 黄启博. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

class MeunViewModel {
    let sections = Observable.just([
        HQB_MenuSection(hearder: "--", items: [
            "发送验证码",
            "登陆",
            "获取电站列表",
            "打招呼",
            "观察者1： AnyObserver、Binder",
            "观察者2： 自定义可绑定属性",
            "Subjects、Variables",
            "变换操作符：buffer、map、flatMap、scan等",
            "过滤操作符：filter、take、skip等",
            "条件和布尔操作符：amb、takeWhile、skipWhile等",
            "结合操作符：startWith、merge、zip等",
            "算数&聚合操作符：toArray、reduce、concat"
            ])
        ])
}
