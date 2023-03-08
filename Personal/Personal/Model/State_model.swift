//
//  State_model.swift
//  TestGckit
//
//  Created by gckit on 2023/03/08. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class State_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kstateDesiccantLeftDaysKey: String = "desiccantLeftDays"
    internal let kstateErrorLevelKey: String = "errorLevel"
    internal let kstateErrorCodeKey: String = "errorCode"
    internal let kstateErrorMsgKey: String = "errorMsg"
    internal let kstateErrorDetailKey: String = "errorDetail"
    internal let kstateFood1Key: String = "food1"
    internal let kstateFood2Key: String = "food2"
    internal let kstateBowelKey: String = "bowel"
    internal let kstateFeedingKey: String = "feeding"
    internal let kstateEatingKey: String = "eating"
    internal let kstateDoorKey: String = "door"
    internal let kstateOtaKey: String = "ota"
    internal let kstateOverallKey: String = "overall"
    internal let kstatePimKey: String = "pim"
    internal let kstateConservationStatusKey: String = "conservationStatus"
    internal let kstateBatteryStatusKey: String = "batteryStatus"
    internal let kstateBatteryPowerKey: String = "batteryPower"
    internal let kstateFeedStateKey: String = "feedState"
    internal let kstateMultiFeedItemKey: String = "multiFeedItem"
    internal let kstateCloudProductKey: String = "cloudProduct"
    internal let kstateServiceStatusKey: String = "serviceStatus"
    internal let kstateTimezoneKey: String = "timezone"
    internal let kstateSharedKey: String = "shared"
    internal let kstateDeviceSharedKey: String = "deviceShared"
    internal let kstateShareOpenKey: String = "shareOpen"

    // MARK: 属性

     var desiccantLeftDays: Int
     var errorLevel: Int
     var errorCode: String
     var errorMsg: String
     var errorDetail: String
     var food1: Int
     var food2: Int
     var bowel: Int
     var feeding: Int
     var eating: Int
     var door: Int
     var ota: Int
     var overall: Int
     var pim: Int
     var conservationStatus: Int
     var batteryStatus: Int
     var batteryPower: Int
     var feedState: FeedState_model?
     var multiFeedItem: MultiFeedItem_model?
     var cloudProduct: CloudProduct_model?
     var serviceStatus: Int
     var timezone: Int
     var shared: Shared_model?
     var deviceShared: DeviceShared_model?
     var shareOpen: Int

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        desiccantLeftDays  = json[kstateDesiccantLeftDaysKey].intValue
        errorLevel  = json[kstateErrorLevelKey].intValue
        errorCode  = json[kstateErrorCodeKey].stringValue
        errorMsg  = json[kstateErrorMsgKey].stringValue
        errorDetail  = json[kstateErrorDetailKey].stringValue
        food1  = json[kstateFood1Key].intValue
        food2  = json[kstateFood2Key].intValue
        bowel  = json[kstateBowelKey].intValue
        feeding  = json[kstateFeedingKey].intValue
        eating  = json[kstateEatingKey].intValue
        door  = json[kstateDoorKey].intValue
        ota  = json[kstateOtaKey].intValue
        overall  = json[kstateOverallKey].intValue
        pim  = json[kstatePimKey].intValue
        conservationStatus  = json[kstateConservationStatusKey].intValue
        batteryStatus  = json[kstateBatteryStatusKey].intValue
        batteryPower  = json[kstateBatteryPowerKey].intValue
        feedState = FeedState_model(json: json[kstateFeedStateKey])
        multiFeedItem = MultiFeedItem_model(json: json[kstateMultiFeedItemKey])
        cloudProduct = CloudProduct_model(json: json[kstateCloudProductKey])
        serviceStatus  = json[kstateServiceStatusKey].intValue
        timezone  = json[kstateTimezoneKey].intValue
        shared = Shared_model(json: json[kstateSharedKey])
        deviceShared = DeviceShared_model(json: json[kstateDeviceSharedKey])
        shareOpen  = json[kstateShareOpenKey].intValue

    }

}
