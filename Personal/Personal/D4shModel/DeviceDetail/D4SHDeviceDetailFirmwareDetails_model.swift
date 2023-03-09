//
//  FirmwareDetails_model.swift
//  TestGckit
//
//  Created by petkit on 2023/03/09. All rights reserved.
//

import Foundation
import SwiftyJSON

class D4SHDeviceDetailFirmwareDetails_model: NSObject {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kfirmwareDetailsModuleKey: String = "module"
    internal let kfirmwareDetailsVersionKey: String = "version"

    // MARK: 属性

     var module: String
     var version: Int

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        module  = json[kfirmwareDetailsModuleKey].stringValue
        version  = json[kfirmwareDetailsVersionKey].intValue

    }

}
