//
//  CommonTools.swift
//  Personal
//
//  Created by wangbinji on 2023/3/6.
//

import Foundation
import UIKit

func setViewController(canLandscape: Bool) {
    let myAppDelegate = UIApplication.shared.delegate as? AppDelegate
    myAppDelegate?.allowRotation = canLandscape
}

func setViewController(isLanscape: Bool, vc: UIViewController) {
    
    if isLanscape {
        if #available(iOS 16.0, *) {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeRight)) { error in
                print(error)
                
            }
            vc.navigationController?.setNeedsUpdateOfSupportedInterfaceOrientations()
            vc.setNeedsUpdateOfSupportedInterfaceOrientations()
        } else {
            // Fallback on earlier versions
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
        }
    } else {
        if #available(iOS 16.0, *) {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
            vc.navigationController?.setNeedsUpdateOfSupportedInterfaceOrientations()
            vc.setNeedsUpdateOfSupportedInterfaceOrientations()
        } else {
            // Fallback on earlier versions
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
}
