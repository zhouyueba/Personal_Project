//
//  Result_model.swift
//  TestGckit
//
//  Created by gckit on 2023/02/28. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class Result_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kresultIdKey: String = "id"
    internal let kresultSecretKey: String = "secret"
    internal let kresultHardwareKey: String = "hardware"
    internal let kresultMacKey: String = "mac"
    internal let kresultFirmwareDetailsKey: String = "firmwareDetails"
    internal let kresultSignupAtKey: String = "signupAt"
    internal let kresultUserKey: String = "user"
    internal let kresultBtMacKey: String = "btMac"
    internal let kresultStateKey: String = "state"
    internal let kresultSettingsKey: String = "settings"
    internal let kresultTencentTupleKey: String = "tencentTuple"
    internal let kresultServiceStatusKey: String = "serviceStatus"
    internal let kresultShareOpenKey: String = "shareOpen"
    internal let kresultRelationKey: String = "relation"
    internal let kresultTimezoneKey: String = "timezone"
    internal let kresultFirmwareKey: String = "firmware"
    internal let kresultSnKey: String = "sn"
    internal let kresultCreatedAtKey: String = "createdAt"
    internal let kresultNameKey: String = "name"

    // MARK: 属性

     var resultid: Int
     var secret: String
     var hardware: Int
     var mac: String
     var firmwareDetails: [FirmwareDetails_model]
     var signupAt: String
     var user: User_model?
     var btMac: String
     var state: State_model?
     var settings: Settings_model?
     var tencentTuple: Int
     var serviceStatus: Int
     var shareOpen: Int
     var relation: Relation_model?
     var timezone: Int
     var firmware: String
     var sn: String
     var createdAt: String
     var name: String

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        resultid  = json[kresultIdKey].intValue
        secret  = json[kresultSecretKey].stringValue
        hardware  = json[kresultHardwareKey].intValue
        mac  = json[kresultMacKey].stringValue
         firmwareDetails  = []
        if let items = json[kresultFirmwareDetailsKey].array {
            for item in items { 
                if let firmwareDetails_model = FirmwareDetails_model(json: item){
                    firmwareDetails.append(firmwareDetails_model)}
            }
        }
        signupAt  = json[kresultSignupAtKey].stringValue
        user = User_model(json: json[kresultUserKey])
        btMac  = json[kresultBtMacKey].stringValue
        state = State_model(json: json[kresultStateKey])
        settings = Settings_model(json: json[kresultSettingsKey])
        tencentTuple  = json[kresultTencentTupleKey].intValue
        serviceStatus  = json[kresultServiceStatusKey].intValue
        shareOpen  = json[kresultShareOpenKey].intValue
        relation = Relation_model(json: json[kresultRelationKey])
        timezone  = json[kresultTimezoneKey].intValue
        firmware  = json[kresultFirmwareKey].stringValue
        sn  = json[kresultSnKey].stringValue
        createdAt  = json[kresultCreatedAtKey].stringValue
        name  = json[kresultNameKey].stringValue

    }

}
