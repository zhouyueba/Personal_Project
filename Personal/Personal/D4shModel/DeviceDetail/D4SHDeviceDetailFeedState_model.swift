//
//  FeedState_model.swift
//  TestGckit
//
//  Created by petkit on 2023/03/09. All rights reserved.
//

import Foundation
import SwiftyJSON

class D4SHDeviceDetailFeedState_model: NSObject {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kfeedStateFeedTimesKey: String = "feedTimes"
    internal let kfeedStateTimesKey: String = "times"
    internal let kfeedStatePlanAmountTotal1Key: String = "planAmountTotal1"
    internal let kfeedStateRealAmountTotal1Key: String = "realAmountTotal1"
    internal let kfeedStateAddAmountTotal1Key: String = "addAmountTotal1"
    internal let kfeedStatePlanAmountTotal2Key: String = "planAmountTotal2"
    internal let kfeedStateRealAmountTotal2Key: String = "realAmountTotal2"
    internal let kfeedStateAddAmountTotal2Key: String = "addAmountTotal2"
    internal let kfeedStatePlanRealAmountTotal1Key: String = "planRealAmountTotal1"
    internal let kfeedStatePlanRealAmountTotal2Key: String = "planRealAmountTotal2"

    // MARK: 属性

     var feedTimes: D4SHDeviceDetailFeedTimes_model?
     var times: String
     var planAmountTotal1: Int
     var realAmountTotal1: Int
     var addAmountTotal1: Int
     var planAmountTotal2: Int
     var realAmountTotal2: Int
     var addAmountTotal2: Int
     var planRealAmountTotal1: Int
     var planRealAmountTotal2: Int

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        feedTimes = D4SHDeviceDetailFeedTimes_model(json: json[kfeedStateFeedTimesKey])
        times  = json[kfeedStateTimesKey].stringValue
        planAmountTotal1  = json[kfeedStatePlanAmountTotal1Key].intValue
        realAmountTotal1  = json[kfeedStateRealAmountTotal1Key].intValue
        addAmountTotal1  = json[kfeedStateAddAmountTotal1Key].intValue
        planAmountTotal2  = json[kfeedStatePlanAmountTotal2Key].intValue
        realAmountTotal2  = json[kfeedStateRealAmountTotal2Key].intValue
        addAmountTotal2  = json[kfeedStateAddAmountTotal2Key].intValue
        planRealAmountTotal1  = json[kfeedStatePlanRealAmountTotal1Key].intValue
        planRealAmountTotal2  = json[kfeedStatePlanRealAmountTotal2Key].intValue

    }

}
