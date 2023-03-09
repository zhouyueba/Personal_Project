//
//  Point_model.swift
//  TestGckit
//
//  Created by petkit on 2023/03/09. All rights reserved.
//

import Foundation
import SwiftyJSON

class D4SHDeviceDetailPoint_model: NSObject {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kpointOwnerNickKey: String = "ownerNick"
    internal let kpointPetNickKey: String = "petNick"

    // MARK: 属性

     var ownerNick: String
     var petNick: String

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        ownerNick  = json[kpointOwnerNickKey].stringValue
        petNick  = json[kpointPetNickKey].stringValue

    }

}
