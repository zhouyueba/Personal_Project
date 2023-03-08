//
//  Settings_model.swift
//  TestGckit
//
//  Created by gckit on 2023/03/08. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class Settings_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let ksettingsDesiccantNotifyKey: String = "desiccantNotify"
    internal let ksettingsFeedNotifyKey: String = "feedNotify"
    internal let ksettingsFoodNotifyKey: String = "foodNotify"
    internal let ksettingsLowBatteryNotifyKey: String = "lowBatteryNotify"
    internal let ksettingsFoodWarnKey: String = "foodWarn"

    // MARK: 属性

     var desiccantNotify: Int
     var feedNotify: Int
     var foodNotify: Int
     var lowBatteryNotify: Int
     var foodWarn: Int

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        desiccantNotify  = json[ksettingsDesiccantNotifyKey].intValue
        feedNotify  = json[ksettingsFeedNotifyKey].intValue
        foodNotify  = json[ksettingsFoodNotifyKey].intValue
        lowBatteryNotify  = json[ksettingsLowBatteryNotifyKey].intValue
        foodWarn  = json[ksettingsFoodWarnKey].intValue

    }

}
