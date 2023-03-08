//
//  Result_model.swift
//  TestGckit
//
//  Created by gckit on 2023/03/08. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class Result_model: ModelProtocol {

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
     var firmwareDetails: [FirmwareDetails_model]
     var hardware: Int
     var resultid: Int
     var mac: String
     var relation: Relation_model?
     var secret: String
     var settings: Settings_model?
     var sn: String
     var state: State_model?

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        createdAt  = json[kresultCreatedAtKey].stringValue
         firmwareDetails  = []
        if let items = json[kresultFirmwareDetailsKey].array {
            for item in items { 
                if let firmwareDetails_model = FirmwareDetails_model(json: item){
                    firmwareDetails.append(firmwareDetails_model)}
            }
        }
        hardware  = json[kresultHardwareKey].intValue
        resultid  = json[kresultIdKey].intValue
        mac  = json[kresultMacKey].stringValue
        relation = Relation_model(json: json[kresultRelationKey])
        secret  = json[kresultSecretKey].stringValue
        settings = Settings_model(json: json[kresultSettingsKey])
        sn  = json[kresultSnKey].stringValue
        state = State_model(json: json[kresultStateKey])

    }

}
