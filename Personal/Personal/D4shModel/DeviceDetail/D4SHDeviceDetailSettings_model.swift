//
//  Settings_model.swift
//  TestGckit
//
//  Created by petkit on 2023/03/09. All rights reserved.
//

import Foundation
import SwiftyJSON

class D4SHDeviceDetailSettings_model: NSObject {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let ksettingsDesiccantNotifyKey: String = "desiccantNotify"
    internal let ksettingsFeedNotifyKey: String = "feedNotify"
    internal let ksettingsFoodNotifyKey: String = "foodNotify"
    internal let ksettingsLowBatteryNotifyKey: String = "lowBatteryNotify"
    internal let ksettingsFoodWarnKey: String = "foodWarn"
    internal let ksettingsFoodWarnRangeKey: String = "foodWarnRange"
    internal let ksettingsLightModeKey: String = "lightMode"
    internal let ksettingsLightMultiRangeKey: String = "lightMultiRange"
    internal let ksettingsLightConfigKey: String = "lightConfig"
    internal let ksettingsToneModeKey: String = "toneMode"
    internal let ksettingsToneMultiRangeKey: String = "toneMultiRange"
    internal let ksettingsToneConfigKey: String = "toneConfig"
    internal let ksettingsManualLockKey: String = "manualLock"
    internal let ksettingsBucketName1Key: String = "bucketName1"
    internal let ksettingsBucketName2Key: String = "bucketName2"
    internal let ksettingsConservationKey: String = "conservation"
    internal let ksettingsCTimeKey: String = "cTime"
    internal let ksettingsCameraKey: String = "camera"
    internal let ksettingsMicrophoneKey: String = "microphone"
    internal let ksettingsNightKey: String = "night"
    internal let ksettingsTimeDisplayKey: String = "timeDisplay"
    internal let ksettingsFeedPictureKey: String = "feedPicture"
    internal let ksettingsEatVideoKey: String = "eatVideo"
    internal let ksettingsPreLiveKey: String = "preLive"
    internal let ksettingsLiveEncryptKey: String = "liveEncrypt"
    internal let ksettingsMoveDetectionKey: String = "moveDetection"
    internal let ksettingsMoveSensitivityKey: String = "moveSensitivity"
    internal let ksettingsMoveNotifyKey: String = "moveNotify"
    internal let ksettingsPetDetectionKey: String = "petDetection"
    internal let ksettingsPetSensitivityKey: String = "petSensitivity"
    internal let ksettingsPetNotifyKey: String = "petNotify"
    internal let ksettingsEatDetectionKey: String = "eatDetection"
    internal let ksettingsEatSensitivityKey: String = "eatSensitivity"
    internal let ksettingsEatNotifyKey: String = "eatNotify"
    internal let ksettingsDetectIntervalKey: String = "detectInterval"
    internal let ksettingsDetectConfigKey: String = "detectConfig"
    internal let ksettingsDetectMultiRangeKey: String = "detectMultiRange"
    internal let ksettingsSoundEnableKey: String = "soundEnable"
    internal let ksettingsSystemSoundEnableKey: String = "systemSoundEnable"
    internal let ksettingsFeedSoundKey: String = "feedSound"
    internal let ksettingsVolumeKey: String = "volume"
    internal let ksettingsSelectedSoundKey: String = "selectedSound"
    internal let ksettingsSurplusControlKey: String = "surplusControl"
    internal let ksettingsHighlightKey: String = "highlight"
    internal let ksettingsUploadKey: String = "upload"

    // MARK: 属性

     var desiccantNotify: Int
     var feedNotify: Int
     var foodNotify: Int
     var lowBatteryNotify: Int
     var foodWarn: Int
     var foodWarnRange: [Int]
     var lightMode: Int
     var lightMultiRange: [Int]
     var lightConfig: Int
     var toneMode: Int
     var toneMultiRange: [Int]
     var toneConfig: Int
     var manualLock: Int
     var bucketName1: String
     var bucketName2: String
     var conservation: Int
     var cTime: Int
     var camera: Int
     var microphone: Int
     var night: Int
     var timeDisplay: Int
     var feedPicture: Int
     var eatVideo: Int
     var preLive: Int
     var liveEncrypt: Int
     var moveDetection: Int
     var moveSensitivity: Int
     var moveNotify: Int
     var petDetection: Int
     var petSensitivity: Int
     var petNotify: Int
     var eatDetection: Int
     var eatSensitivity: Int
     var eatNotify: Int
     var detectInterval: Int
     var detectConfig: Int
     var detectMultiRange: Int
     var soundEnable: Int
     var systemSoundEnable: Int
     var feedSound: Int
     var volume: Int
     var selectedSound: Int
     var surplusControl: Int
     var highlight: Int
     var upload: Int

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        desiccantNotify  = json[ksettingsDesiccantNotifyKey].intValue
        feedNotify  = json[ksettingsFeedNotifyKey].intValue
        foodNotify  = json[ksettingsFoodNotifyKey].intValue
        lowBatteryNotify  = json[ksettingsLowBatteryNotifyKey].intValue
        foodWarn  = json[ksettingsFoodWarnKey].intValue
         foodWarnRange  = []
        if let items = json[ksettingsFoodWarnRangeKey].array {
            for item in items {
                 foodWarnRange.append(item.intValue)
            }
        }
        lightMode  = json[ksettingsLightModeKey].intValue
         lightMultiRange  = []
        if let items = json[ksettingsLightMultiRangeKey].array {
            for item in items {
                 lightMultiRange.append(item.intValue)
            }
        }
        lightConfig  = json[ksettingsLightConfigKey].intValue
        toneMode  = json[ksettingsToneModeKey].intValue
         toneMultiRange  = []
        if let items = json[ksettingsToneMultiRangeKey].array {
            for item in items {
                 toneMultiRange.append(item.intValue)
            }
        }
        toneConfig  = json[ksettingsToneConfigKey].intValue
        manualLock  = json[ksettingsManualLockKey].intValue
        bucketName1  = json[ksettingsBucketName1Key].stringValue
        bucketName2  = json[ksettingsBucketName2Key].stringValue
        conservation  = json[ksettingsConservationKey].intValue
        cTime  = json[ksettingsCTimeKey].intValue
        camera  = json[ksettingsCameraKey].intValue
        microphone  = json[ksettingsMicrophoneKey].intValue
        night  = json[ksettingsNightKey].intValue
        timeDisplay  = json[ksettingsTimeDisplayKey].intValue
        feedPicture  = json[ksettingsFeedPictureKey].intValue
        eatVideo  = json[ksettingsEatVideoKey].intValue
        preLive  = json[ksettingsPreLiveKey].intValue
        liveEncrypt  = json[ksettingsLiveEncryptKey].intValue
        moveDetection  = json[ksettingsMoveDetectionKey].intValue
        moveSensitivity  = json[ksettingsMoveSensitivityKey].intValue
        moveNotify  = json[ksettingsMoveNotifyKey].intValue
        petDetection  = json[ksettingsPetDetectionKey].intValue
        petSensitivity  = json[ksettingsPetSensitivityKey].intValue
        petNotify  = json[ksettingsPetNotifyKey].intValue
        eatDetection  = json[ksettingsEatDetectionKey].intValue
        eatSensitivity  = json[ksettingsEatSensitivityKey].intValue
        eatNotify  = json[ksettingsEatNotifyKey].intValue
        detectInterval  = json[ksettingsDetectIntervalKey].intValue
        detectConfig  = json[ksettingsDetectConfigKey].intValue
        detectMultiRange  = json[ksettingsDetectMultiRangeKey].intValue
        soundEnable  = json[ksettingsSoundEnableKey].intValue
        systemSoundEnable  = json[ksettingsSystemSoundEnableKey].intValue
        feedSound  = json[ksettingsFeedSoundKey].intValue
        volume  = json[ksettingsVolumeKey].intValue
        selectedSound  = json[ksettingsSelectedSoundKey].intValue
        surplusControl  = json[ksettingsSurplusControlKey].intValue
        highlight  = json[ksettingsHighlightKey].intValue
        upload  = json[ksettingsUploadKey].intValue

    }

}
