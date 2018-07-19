//
//  ServerAccessAPI.swift
//  RxSwiftDemo
//
//  Created by Harry.huang on 2018/6/22.
//  Copyright © 2018年 黄启博. All rights reserved.
//

import Foundation
import Moya

enum UserProfile {
    case sms(phoneNum: String)
}

extension UserProfile: TargetType {
    
    // 网络请求的任务类型
    var task: Moya.Task {
        return .request
    }
    
    // 传递的参数
    var parameters: [String : Any]? {
        return ["phone_number": "13750088412"]
    }
    
    // 编码类型
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    // 基础服务器地址和端口
    var baseURL: URL {
        return URL(string: "https://ci5.lcola.cn:443/")!
    }
    
    // 具体某个方法的路径
    var path: String {
        switch self {
        case .sms(phoneNum:):
            return "/api/sms/code"
        }
    }
    
    //请求的方法
    var method: Moya.Method {
        switch self {
        case .sms(phoneNum:):
            return .get
        }
    }
    
    // 用于单元测试
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    // headers信息
    var headers: [String : String]? {
        return  ["AppVersion": "1.4.1", "User-Agent": "DeviceBrand:iPhone;DeviceModel:Simulator (iPhone 6 Plus);OS:iOS;OSVersion:iOS 11.2", "Authorization": "Basic bGNvbGE6TGMwIWEkJCQyMDE2"]

    }
}
