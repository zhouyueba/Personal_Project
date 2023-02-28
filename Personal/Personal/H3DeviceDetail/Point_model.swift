//
//  Point_model.swift
//  TestGckit
//
//  Created by gckit on 2023/02/28. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class Point_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kpointHonourKey: String = "honour"
    internal let kpointGrowthKey: String = "growth"
    internal let kpointStartGrowthKey: String = "startGrowth"
    internal let kpointRankKey: String = "rank"
    internal let kpointEndGrowthKey: String = "endGrowth"
    internal let kpointIconKey: String = "icon"
    internal let kpointIcon2Key: String = "icon2"

    // MARK: 属性

     var honour: String
     var growth: Int
     var startGrowth: Int
     var rank: Int
     var endGrowth: Int
     var icon: String
     var icon2: String

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        honour  = json[kpointHonourKey].stringValue
        growth  = json[kpointGrowthKey].intValue
        startGrowth  = json[kpointStartGrowthKey].intValue
        rank  = json[kpointRankKey].intValue
        endGrowth  = json[kpointEndGrowthKey].intValue
        icon  = json[kpointIconKey].stringValue
        icon2  = json[kpointIcon2Key].stringValue

    }

}
