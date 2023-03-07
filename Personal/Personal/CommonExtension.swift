//
//  CommonExtension.swift
//  Personal
//
//  Created by wangbinji on 2023/3/6.
//

import Foundation
import UIKit

extension UIColor {
    // 新增初始化方法
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}

extension UITableViewCell {
    
    private func getTableView() -> UITableView? {
        if let tableView = self.superview as? UITableView {
            return tableView
        }
        if let tableView = self.superview?.superview as? UITableView {
            return tableView
        }
        return nil
    }
    
    func addSectionCorner(at indexPath: IndexPath, radius: CGFloat = 10) {
        let tableView = self.getTableView()!
        let rows = tableView.numberOfRows(inSection: indexPath.section)
        if indexPath.row == 0 || indexPath.row == rows - 1 {
            var corner: UIRectCorner
            if rows == 1 {
                corner = UIRectCorner.allCorners
            } else if indexPath.row == 0 {
                let cornerRawValue = UIRectCorner.topLeft.rawValue | UIRectCorner.topRight.rawValue
                corner = UIRectCorner(rawValue: cornerRawValue)
            } else {
                let cornerRawValue = UIRectCorner.bottomLeft.rawValue | UIRectCorner.bottomRight.rawValue
                corner = UIRectCorner(rawValue: cornerRawValue)
            }
            let cornerLayer = CAShapeLayer()
            cornerLayer.masksToBounds = true
            cornerLayer.frame = self.bounds
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
            cornerLayer.path = path.cgPath
            self.layer.mask = cornerLayer
        } else {
            self.layer.mask = nil
        }
    }
}
