//
//  Result_model.swift
//  TestGckit
//
//  Created by gckit on 2023/02/28. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class getDeviceXp2pInfoResult_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kresultSysXp2pInfoKey: String = "sysXp2pInfo"
    internal let kresultDevInfoKey: String = "devInfo"
    internal let kresultProductKeyKey: String = "productKey"
    internal let kresultDeviceNameKey: String = "deviceName"

    // MARK: 属性

     var sysXp2pInfo: SysXp2pInfo_model?
     var devInfo: DevInfo_model?
     var productKey: String
     var deviceName: String

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        sysXp2pInfo = SysXp2pInfo_model(json: json[kresultSysXp2pInfoKey])
        devInfo = DevInfo_model(json: json[kresultDevInfoKey])
        productKey  = json[kresultProductKeyKey].stringValue
        deviceName  = json[kresultDeviceNameKey].stringValue

    }

}
