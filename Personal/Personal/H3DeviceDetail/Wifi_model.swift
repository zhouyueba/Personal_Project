//
//  Wifi_model.swift
//  TestGckit
//
//  Created by gckit on 2023/02/28. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class Wifi_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kwifiBssidKey: String = "bssid"
    internal let kwifiRsqKey: String = "rsq"
    internal let kwifiSsidKey: String = "ssid"

    // MARK: 属性

     var bssid: String
     var rsq: Int
     var ssid: String

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        bssid  = json[kwifiBssidKey].stringValue
        rsq  = json[kwifiRsqKey].intValue
        ssid  = json[kwifiSsidKey].stringValue

    }

}
