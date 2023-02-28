//
//  Settings_model.swift
//  TestGckit
//
//  Created by gckit on 2023/02/28. All rights reserved.
//

import Foundation
import SwiftyJSON
//import ModelProtocol

class Settings_model: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let ksettingsPetAlarmIntervalKey: String = "petAlarmInterval"
    internal let ksettingsLapseTimeKey: String = "lapseTime"
    internal let ksettingsHighlightKey: String = "highlight"
    internal let ksettingsShootingKey: String = "shooting"
    internal let ksettingsMoveTrackingKey: String = "moveTracking"
    internal let ksettingsLanguageKey: String = "language"
    internal let ksettingsLanguageFollowKey: String = "languageFollow"
    internal let ksettingsMoveDetectionKey: String = "moveDetection"
    internal let ksettingsLanguagesKey: String = "languages"
    internal let ksettingsMoveSensitivityKey: String = "moveSensitivity"
    internal let ksettingsPetNotifyKey: String = "petNotify"
    internal let ksettingsPetDetectionKey: String = "petDetection"
    internal let ksettingsCardShootingKey: String = "cardShooting"
    internal let ksettingsReversalKey: String = "reversal"
    internal let ksettingsInfraredKey: String = "infrared"
    internal let ksettingsTimeDisplayKey: String = "timeDisplay"
    internal let ksettingsLapseVideoKey: String = "lapseVideo"
    internal let ksettingsMoveAlarmIntervalKey: String = "moveAlarmInterval"
    internal let ksettingsPetSensitivityKey: String = "petSensitivity"
    internal let ksettingsMoveNotifyKey: String = "moveNotify"
    internal let ksettingsMicrophoneKey: String = "microphone"

    // MARK: 属性

     var petAlarmInterval: Int
     var lapseTime: Int
     var highlight: Int
     var shooting: Int
     var moveTracking: Int
     var language: String
     var languageFollow: Int
     var moveDetection: Int
     var languages: [String]
     var moveSensitivity: Int
     var petNotify: Int
     var petDetection: Int
     var cardShooting: Int
     var reversal: Int
     var infrared: Int
     var timeDisplay: Int
     var lapseVideo: Int
     var moveAlarmInterval: Int
     var petSensitivity: Int
     var moveNotify: Int
     var microphone: Int

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        petAlarmInterval  = json[ksettingsPetAlarmIntervalKey].intValue
        lapseTime  = json[ksettingsLapseTimeKey].intValue
        highlight  = json[ksettingsHighlightKey].intValue
        shooting  = json[ksettingsShootingKey].intValue
        moveTracking  = json[ksettingsMoveTrackingKey].intValue
        language  = json[ksettingsLanguageKey].stringValue
        languageFollow  = json[ksettingsLanguageFollowKey].intValue
        moveDetection  = json[ksettingsMoveDetectionKey].intValue
         languages  = []
        if let items = json[ksettingsLanguagesKey].array {
            for item in items {
                 languages.append(item.stringValue)
            }
        }
        moveSensitivity  = json[ksettingsMoveSensitivityKey].intValue
        petNotify  = json[ksettingsPetNotifyKey].intValue
        petDetection  = json[ksettingsPetDetectionKey].intValue
        cardShooting  = json[ksettingsCardShootingKey].intValue
        reversal  = json[ksettingsReversalKey].intValue
        infrared  = json[ksettingsInfraredKey].intValue
        timeDisplay  = json[ksettingsTimeDisplayKey].intValue
        lapseVideo  = json[ksettingsLapseVideoKey].intValue
        moveAlarmInterval  = json[ksettingsMoveAlarmIntervalKey].intValue
        petSensitivity  = json[ksettingsPetSensitivityKey].intValue
        moveNotify  = json[ksettingsMoveNotifyKey].intValue
        microphone  = json[ksettingsMicrophoneKey].intValue

    }

}
