//
//  Shared_model.swift
//  TestGckit
//
//  Created by petkit on 2023/03/09. All rights reserved.
//

import Foundation
import SwiftyJSON

class D4SHDeviceDetailShared_model: NSObject {

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
     var point: D4SHDeviceDetailPoint_model?
     var avatar: String

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        gender  = json[ksharedGenderKey].intValue
        sharedid  = json[ksharedIdKey].stringValue
        nick  = json[ksharedNickKey].stringValue
        point = D4SHDeviceDetailPoint_model(json: json[ksharedPointKey])
        avatar  = json[ksharedAvatarKey].stringValue

    }

}
