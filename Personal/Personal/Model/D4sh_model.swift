//
//  D4sh_model.swift
//  TestGckit
//
//  Created by gckit on 2023/03/08. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class D4sh_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kd4shResultKey: String = "result"

    // MARK: 属性

     var result: Result_model?

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        result = Result_model(json: json[kd4shResultKey])

    }

}
