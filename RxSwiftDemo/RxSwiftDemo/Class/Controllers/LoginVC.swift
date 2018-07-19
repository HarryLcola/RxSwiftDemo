//
//  LoginVC.swift
//  RxSwiftDemo
//
//  Created by Harry.huang on 2018/6/25.
//  Copyright © 2018年 黄启博. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginVC: UIViewController {
    @IBOutlet var accountTextField: UITextField!
    @IBOutlet var errorMessageLabel: UILabel!
    @IBOutlet var codeTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 检验手机号码位数
        let accountValid: Observable = accountTextField.rx.text.orEmpty.map { value in
                return value.count == 11
            
        }
        let codeValid: Observable = codeTextField.rx.text.orEmpty.map {
            value in
            return value.count == 6
        }
        accountValid.bind(to: errorMessageLabel.rx.isHidden)
        .disposed(by: rx.disposeBag)
        
        // 绑定登陆按钮是否可用
        let loginObserver = Observable.combineLatest(accountValid, codeValid ){(account, code) in
            account && code
        }
        
        // 绑定按钮
        loginObserver.bind(to: loginButton.rx.isEnabled)
        .disposed(by: rx.disposeBag)
        loginObserver.subscribe(onNext: { [unowned self] valid in
            self.loginButton.alpha = valid ? 1:  0.5
        }).disposed(by: rx.disposeBag)
    }
}
