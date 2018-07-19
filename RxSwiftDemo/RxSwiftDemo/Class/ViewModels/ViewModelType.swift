//
//  ViewModelType.swift
//  RxSwiftDemo
//
//  Created by Harry.huang on 2018/7/19.
//  Copyright © 2018年 黄启博. All rights reserved.
//

import Foundation
// MARK: - 不用Subject
protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}

