//
//  Pets_model.swift
//  TestGckit
//
//  Created by gckit on 2023/03/08. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class Pets_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kpetsIdKey: String = "id"
    internal let kpetsAvatarKey: String = "avatar"
    internal let kpetsNameKey: String = "name"

    // MARK: 属性

     var petsid: String
     var avatar: String
     var name: String

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        petsid  = json[kpetsIdKey].stringValue
        avatar  = json[kpetsAvatarKey].stringValue
        name  = json[kpetsNameKey].stringValue

    }

}
