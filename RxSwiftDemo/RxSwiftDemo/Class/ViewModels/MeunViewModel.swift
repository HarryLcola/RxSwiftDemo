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
            "基本介绍、安装配置",
            "响应式编程与传统式编程的比较样例",
            "Observable介绍、创建可观察序列",
            "Observable订阅、事件监听、订阅销毁",
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
