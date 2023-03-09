//
//  D4sh_model.swift
//  TestGckit
//
//  Created by petkit on 2023/03/09. All rights reserved.
//

import Foundation
import SwiftyJSON

class D4sh_model: NSObject {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kd4shResultKey: String = "result"

    // MARK: 属性

     var result: D4SHDeviceDetailResult_model?

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        result = D4SHDeviceDetailResult_model(json: json[kd4shResultKey])

    }

}
