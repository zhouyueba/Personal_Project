//
//  User_model.swift
//  TestGckit
//
//  Created by gckit on 2023/02/28. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class User_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kuserGenderKey: String = "gender"
    internal let kuserIdKey: String = "id"
    internal let kuserNickKey: String = "nick"
    internal let kuserPointKey: String = "point"
    internal let kuserAvatarKey: String = "avatar"

    // MARK: 属性

     var gender: Int
     var userid: String
     var nick: String
     var point: Point_model?
     var avatar: String

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        gender  = json[kuserGenderKey].intValue
        userid  = json[kuserIdKey].stringValue
        nick  = json[kuserNickKey].stringValue
        point = Point_model(json: json[kuserPointKey])
        avatar  = json[kuserAvatarKey].stringValue

    }

}
