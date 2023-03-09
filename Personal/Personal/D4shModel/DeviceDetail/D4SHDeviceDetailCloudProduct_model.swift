//
//  CloudProduct_model.swift
//  TestGckit
//
//  Created by petkit on 2023/03/09. All rights reserved.
//

import Foundation
import SwiftyJSON

class D4SHDeviceDetailCloudProduct_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kcloudProductServiceIdKey: String = "serviceId"
    internal let kcloudProductNameKey: String = "name"
    internal let kcloudProductShortNameKey: String = "shortName"
    internal let kcloudProductOrderIdKey: String = "orderId"
    internal let kcloudProductSkuIdKey: String = "skuId"
    internal let kcloudProductSubscribeKey: String = "subscribe"
    internal let kcloudProductCloudStorageKey: String = "cloudStorage"
    internal let kcloudProductHighlightKey: String = "highlight"
    internal let kcloudProductLapseKey: String = "lapse"
    internal let kcloudProductCycleKey: String = "cycle"
    internal let kcloudProductServiceTimeKey: String = "serviceTime"
    internal let kcloudProductServiceUnitKey: String = "serviceUnit"
    internal let kcloudProductWorkTimeKey: String = "workTime"
    internal let kcloudProductWorkIndateKey: String = "workIndate"

    // MARK: 属性

     var serviceId: Int
     var name: String
     var shortName: String
     var orderId: Int
     var skuId: Int
     var subscribe: Int
     var cloudStorage: String
     var highlight: Int
     var lapse: Int
     var cycle: Int
     var serviceTime: Int
     var serviceUnit: String
     var workTime: String
     var workIndate: String

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        serviceId  = json[kcloudProductServiceIdKey].intValue
        name  = json[kcloudProductNameKey].stringValue
        shortName  = json[kcloudProductShortNameKey].stringValue
        orderId  = json[kcloudProductOrderIdKey].intValue
        skuId  = json[kcloudProductSkuIdKey].intValue
        subscribe  = json[kcloudProductSubscribeKey].intValue
        cloudStorage  = json[kcloudProductCloudStorageKey].stringValue
        highlight  = json[kcloudProductHighlightKey].intValue
        lapse  = json[kcloudProductLapseKey].intValue
        cycle  = json[kcloudProductCycleKey].intValue
        serviceTime  = json[kcloudProductServiceTimeKey].intValue
        serviceUnit  = json[kcloudProductServiceUnitKey].stringValue
        workTime  = json[kcloudProductWorkTimeKey].stringValue
        workIndate  = json[kcloudProductWorkIndateKey].stringValue

    }

}
