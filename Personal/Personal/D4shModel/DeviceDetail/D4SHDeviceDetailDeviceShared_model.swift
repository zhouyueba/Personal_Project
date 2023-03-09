//
//  DeviceShared_model.swift
//  TestGckit
//
//  Created by petkit on 2023/03/09. All rights reserved.
//

import Foundation
import SwiftyJSON

class D4SHDeviceDetailDeviceShared_model: NSObject {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kdeviceSharedOwnerNickKey: String = "ownerNick"
    internal let kdeviceSharedOwnerIdKey: String = "ownerId"
    internal let kdeviceSharedNickKey: String = "nick"
    internal let kdeviceSharedPetsKey: String = "pets"

    // MARK: 属性

     var ownerNick: Int
     var ownerId: String
     var nick: String
     var pets: [D4SHDeviceDetailPets_model]

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        ownerNick  = json[kdeviceSharedOwnerNickKey].intValue
        ownerId  = json[kdeviceSharedOwnerIdKey].stringValue
        nick  = json[kdeviceSharedNickKey].stringValue
         pets  = []
        if let items = json[kdeviceSharedPetsKey].array {
            for item in items { 
                if let pets_model = D4SHDeviceDetailPets_model(json: item){
                    pets.append(pets_model)}
            }
        }

    }

}
