//
//  Relation_model.swift
//  TestGckit
//
//  Created by petkit on 2023/03/09. All rights reserved.
//

import Foundation
import SwiftyJSON

class D4SHDeviceDetailRelation_model: NSObject {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let krelationUserIdKey: String = "userId"

    // MARK: 属性

     var userId: String

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        userId  = json[krelationUserIdKey].stringValue

    }

}
