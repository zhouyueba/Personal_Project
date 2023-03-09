//
//  Result_model.swift
//  TestGckit
//
//  Created by petkit on 2023/03/09. All rights reserved.
//

import Foundation
import SwiftyJSON

class D4SHDeviceDetailResult_model: NSObject {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kresultCreatedAtKey: String = "createdAt"
    internal let kresultFirmwareDetailsKey: String = "firmwareDetails"
    internal let kresultHardwareKey: String = "hardware"
    internal let kresultIdKey: String = "id"
    internal let kresultMacKey: String = "mac"
    internal let kresultRelationKey: String = "relation"
    internal let kresultSecretKey: String = "secret"
    internal let kresultSettingsKey: String = "settings"
    internal let kresultSnKey: String = "sn"
    internal let kresultStateKey: String = "state"

    // MARK: 属性

     var createdAt: String
     var firmwareDetails: [D4SHDeviceDetailFirmwareDetails_model]
     var hardware: Int
     var resultid: Int
     var mac: String
     var relation: D4SHDeviceDetailRelation_model?
     var secret: String
     var settings: D4SHDeviceDetailSettings_model?
     var sn: String
     var state: D4SHDeviceDetailState_model?

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        createdAt  = json[kresultCreatedAtKey].stringValue
         firmwareDetails  = []
        if let items = json[kresultFirmwareDetailsKey].array {
            for item in items { 
                if let firmwareDetails_model = D4SHDeviceDetailFirmwareDetails_model(json: item){
                    firmwareDetails.append(firmwareDetails_model)}
            }
        }
        hardware  = json[kresultHardwareKey].intValue
        resultid  = json[kresultIdKey].intValue
        mac  = json[kresultMacKey].stringValue
        relation = D4SHDeviceDetailRelation_model(json: json[kresultRelationKey])
        secret  = json[kresultSecretKey].stringValue
        settings = D4SHDeviceDetailSettings_model(json: json[kresultSettingsKey])
        sn  = json[kresultSnKey].stringValue
        state = D4SHDeviceDetailState_model(json: json[kresultStateKey])

    }

}
