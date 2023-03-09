//
//  FeedDailyList_model.swift
//  TestGckit
//
//  Created by petkit on 2023/03/09. All rights reserved.
//

import Foundation
import SwiftyJSON

class D4SHDeviceDetailFeedDailyList_model: NSObject {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kfeedDailyListItemsKey: String = "items"
    internal let kfeedDailyListRepeatsKey: String = "repeats"
    internal let kfeedDailyListSuspendedKey: String = "suspended"

    // MARK: 属性

     var items: [Int]
     var repeats: Int
     var suspended: Int

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

         items  = []
        if let items = json[kfeedDailyListItemsKey].array {
            for item in items {
//                 items.append(item.intValue)
            }
        }
        repeats  = json[kfeedDailyListRepeatsKey].intValue
        suspended  = json[kfeedDailyListSuspendedKey].intValue

    }

}
