//
//  Shared_model.swift
//  TestGckit
//
//  Created by gckit on 2023/03/08. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class Shared_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let ksharedGenderKey: String = "gender"
    internal let ksharedIdKey: String = "id"
    internal let ksharedNickKey: String = "nick"
    internal let ksharedPointKey: String = "point"
    internal let ksharedAvatarKey: String = "avatar"

    // MARK: 属性

     var gender: Int
     var sharedid: String
     var nick: String
     var point: Point_model?
     var avatar: String

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        gender  = json[ksharedGenderKey].intValue
        sharedid  = json[ksharedIdKey].stringValue
        nick  = json[ksharedNickKey].stringValue
        point = Point_model(json: json[ksharedPointKey])
        avatar  = json[ksharedAvatarKey].stringValue

    }

}
