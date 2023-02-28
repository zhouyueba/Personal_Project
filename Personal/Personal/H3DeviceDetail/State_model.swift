//
//  State_model.swift
//  TestGckit
//
//  Created by gckit on 2023/02/28. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class State_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kstateIspEvKey: String = "ispEv"
    internal let kstateLapseKey: String = "lapse"
    internal let kstatePimKey: String = "pim"
    internal let kstateWbRgainKey: String = "wbRgain"
    internal let kstateWbBgainKey: String = "wbBgain"
    internal let kstatePowerKey: String = "power"
    internal let kstateOtaKey: String = "ota"
    internal let kstateOverallKey: String = "overall"
    internal let kstateWifiKey: String = "wifi"

    // MARK: 属性

     var ispEv: Int
     var lapse: Int
     var pim: Int
     var wbRgain: Int
     var wbBgain: Int
     var power: Int
     var ota: Int
     var overall: Int
     var wifi: Wifi_model?

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        ispEv  = json[kstateIspEvKey].intValue
        lapse  = json[kstateLapseKey].intValue
        pim  = json[kstatePimKey].intValue
        wbRgain  = json[kstateWbRgainKey].intValue
        wbBgain  = json[kstateWbBgainKey].intValue
        power  = json[kstatePowerKey].intValue
        ota  = json[kstateOtaKey].intValue
        overall  = json[kstateOverallKey].intValue
        wifi = Wifi_model(json: json[kstateWifiKey])

    }

}
