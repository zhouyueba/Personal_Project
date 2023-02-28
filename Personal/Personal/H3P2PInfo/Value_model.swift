//
//  Value_model.swift
//  TestGckit
//
//  Created by gckit on 2023/02/28. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class Value_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kValueAudio_codecKey: String = "audio_codec"
    internal let kValueVideo_codecKey: String = "video_codec"

    // MARK: 属性

     var audio_codec: String
     var video_codec: String

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        audio_codec  = json[kValueAudio_codecKey].stringValue
        video_codec  = json[kValueVideo_codecKey].stringValue

    }

}
