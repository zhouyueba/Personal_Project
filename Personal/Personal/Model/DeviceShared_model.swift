//
//  DeviceShared_model.swift
//  TestGckit
//
//  Created by gckit on 2023/03/08. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class DeviceShared_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kdeviceSharedOwnerNickKey: String = "ownerNick"
    internal let kdeviceSharedOwnerIdKey: String = "ownerId"
    internal let kdeviceSharedNickKey: String = "nick"
    internal let kdeviceSharedPetsKey: String = "pets"

    // MARK: 属性

     var ownerNick: Int
     var ownerId: String
     var nick: String
     var pets: [Pets_model]

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        ownerNick  = json[kdeviceSharedOwnerNickKey].intValue
        ownerId  = json[kdeviceSharedOwnerIdKey].stringValue
        nick  = json[kdeviceSharedNickKey].stringValue
         pets  = []
        if let items = json[kdeviceSharedPetsKey].array {
            for item in items { 
                if let pets_model = Pets_model(json: item){
                    pets.append(pets_model)}
            }
        }

    }

}
