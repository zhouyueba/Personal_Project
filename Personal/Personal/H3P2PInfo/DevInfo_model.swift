//
//  DevInfo_model.swift
//  TestGckit
//
//  Created by gckit on 2023/02/28. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class DevInfo_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kdevInfoValueKey: String = "Value"
    internal let kdevInfoLastUpdateKey: String = "LastUpdate"

    // MARK: 属性

     var Value: Value_model?
     var LastUpdate: Int

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        Value = Value_model(json: json[kdevInfoValueKey])
        LastUpdate  = json[kdevInfoLastUpdateKey].intValue

    }

}
