//
//  SayHelioVIewModel.swift
//  RxSwiftDemo
//
//  Created by Harry.huang on 2018/7/19.
//  Copyright © 2018年 黄启博. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
// MARK: - 不用Subject
final class SayHelloViewModel: ViewModelType {


    struct Input {
        let name: Observable<String>
        let validate: Observable<Void>
    }

    struct Output {
        let greeting: Driver<String>
    }

    func transform(input: SayHelloViewModel.Input) -> SayHelloViewModel.Output {
        let greeting = input.validate
        .withLatestFrom(input.name)
            .map { name in
                return "Hello \(name)"
        }
        .startWith("")
        .asDriver(onErrorJustReturn: "500航班起飞✈️✈️✈️")

        return Output(greeting: greeting)
    }
}

