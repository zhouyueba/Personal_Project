//
//  Relation_model.swift
//  TestGckit
//
//  Created by gckit on 2023/03/08. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class Relation_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let krelationUserIdKey: String = "userId"

    // MARK: 属性

     var userId: String

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        userId  = json[krelationUserIdKey].stringValue

    }

}
