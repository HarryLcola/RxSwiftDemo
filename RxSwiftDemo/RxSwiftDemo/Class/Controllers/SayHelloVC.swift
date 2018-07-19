//
//  SayHelloVC.swift
//  RxSwiftDemo
//
//  Created by Harry.huang on 2018/7/19.
//  Copyright © 2018年 黄启博. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class SayHelloVC: UIViewController {
    
    @IBOutlet var greetingLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var greetingButton: UIButton!
    
    private let viewModel = SayHelloViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    private func bindViewModel() {
        let inputs = SayHelloViewModel.Input(name: (nameTextField.rx.text.orEmpty.asObservable()), validate: (greetingButton.rx.tap.asObservable()))
        let outputs = viewModel.transform(input: inputs)
        outputs.greeting
        .drive(greetingLabel.rx.text)
        .disposed(by: rx.disposeBag)
    }
}

