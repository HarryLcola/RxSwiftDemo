 //
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by Harry.huang on 2018/6/15.
//  Copyright © 2018年 黄启博. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import NSObject_Rx
import ObjectMapper
import Moya

class ViewController: UIViewController {
    let cellIdentifier = "cell"
    let meunViewModel = MeunViewModel()
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    //  MARK: - tableView 的 运用
    func setTableView() {
        // MARK: -- 注册cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        // MARK: -- 创建数据源
        let dataSource = RxTableViewSectionedReloadDataSource<HQB_MenuSection>()
        dataSource.configureCell = {
            (ds, tv, ip, e) in
            let cell = self.tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier)
            cell?.textLabel?.text = "\(e)"
            return cell!
        }
        
        // MARK: -- 绑定单元格数据
        meunViewModel.sections.bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: rx.disposeBag)
        
        
        // MARK: - 按钮点击事件
        tableView.rx.itemSelected.map { indexPath in
            return (indexPath, dataSource[indexPath])
            }.subscribe(onNext: { indexPath, model in
                self.clickTableViewCellWith(indexpath: indexPath)
            }).disposed(by: rx.disposeBag)
    }
    
    func clickTableViewCellWith(indexpath: IndexPath) {
        switch indexpath.row {
        case 0: do {
            let provider = RxMoyaProvider<UserProfile>()
            
            provider.request(.sms(phoneNum: "13750088412"))
            .filterSuccessfulStatusCodes()
                .mapJSON().subscribe(onNext: { json in
                    print(json)
                    let message  = json as! Dictionary<String, Any>
                    
                    let alertView = UIAlertController(title: "提示", message: "\(message["result"]!)", preferredStyle: .alert)
                    self.present(alertView, animated: true, completion: nil)
                }).addDisposableTo(rx.disposeBag)
            }
        case 1:
            self.performSegue(withIdentifier: "showLoginVCSegue", sender: nil)
        case 2:
            // 获取电站数据
            let provider = RxMoyaProvider<StationAPI>()
            provider.request(.getStationList()) { result in
                print(result)
                if case let .success(response) = result {
                    let data = try? response.mapJSON()
//                    print(data)
                }
            }
        case 3:
            self.performSegue(withIdentifier: "showSayHelloVCSegue", sender: nil)
        default:
            return
        }
    }
}

