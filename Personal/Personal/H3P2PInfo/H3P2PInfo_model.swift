//
//  H3P2PInfo_model.swift
//  TestGckit
//
//  Created by gckit on 2023/02/28. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class H3P2PInfo_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kH3P2PInfoResultKey: String = "result"

    // MARK: 属性

     var result: Result_model?

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        result = Result_model(json: json[kH3P2PInfoResultKey])

    }

}
