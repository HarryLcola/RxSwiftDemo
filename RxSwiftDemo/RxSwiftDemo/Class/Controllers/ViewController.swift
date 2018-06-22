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
        let dataSource = RxTableViewSectionedAnimatedDataSource<HQB_MenuSection>(configureCell: {
            (ds, tv, ip, e) in
            let cell = self.tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier)
            cell?.textLabel?.text = "\(e)"
            return cell!
        }, titleForHeaderInSection: { ds, index in
            return ds.sectionModels[index].hearder
        })
        
        // MARK: -- 绑定单元格数据
        meunViewModel.sections.bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: rx.disposeBag)
        
        
        // MARK: - 按钮点击事件
        tableView.rx.itemSelected.map { indexPath in
            return (indexPath, dataSource[indexPath])
            }.subscribe(onNext: { indexPath, model in
                print(model)
            }).disposed(by: rx.disposeBag)
        /// 或者也可以用下面的方法
//        tableView.rx.modelSelected(HQB_MenuSection.self).subscribe(onNext: { model in
//            print(model)
//        }).disposed(by: rx.disposeBag)
    }
}

