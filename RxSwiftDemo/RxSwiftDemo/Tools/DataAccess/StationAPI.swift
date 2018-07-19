//
//  StationAPI.swift
//  RxSwiftDemo
//
//  Created by Harry.huang on 2018/7/16.
//  Copyright © 2018年 黄启博. All rights reserved.
//

import Foundation
import Moya
enum StationAPI {
    case getStationList()
}
extension StationAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://ci5.lcola.cn:443/")!
    }
    
    var path: String {
        return "api/v2/charge_stations"
    }
    
    var method:Moya.Method {
        return .get
    }
    
    var parameters: [String : Any]? {
        return [:]
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
         return .request
    }
    
    
}
