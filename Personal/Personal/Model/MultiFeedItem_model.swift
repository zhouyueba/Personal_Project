//
//  MultiFeedItem_model.swift
//  TestGckit
//
//  Created by gckit on 2023/03/08. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class MultiFeedItem_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kmultiFeedItemFeedDailyListKey: String = "feedDailyList"
    internal let kmultiFeedItemIsExecutedKey: String = "isExecuted"
    internal let kmultiFeedItemUserIdKey: String = "userId"

    // MARK: 属性

     var feedDailyList: [FeedDailyList_model]
     var isExecuted: Int
     var userId: String

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

         feedDailyList  = []
        if let items = json[kmultiFeedItemFeedDailyListKey].array {
            for item in items { 
                if let feedDailyList_model = FeedDailyList_model(json: item){
                    feedDailyList.append(feedDailyList_model)}
            }
        }
        isExecuted  = json[kmultiFeedItemIsExecutedKey].intValue
        userId  = json[kmultiFeedItemUserIdKey].stringValue

    }

}
