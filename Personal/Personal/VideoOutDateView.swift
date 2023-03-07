//
//  VideoOutDateView.swift
//  Personal
//
//  Created by wangbinji on 2023/3/7.
//

import UIKit

class VideoOutDateView: UIView {

    lazy var topTextL: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 16)
        label.text = "视频已过期"
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    lazy var bottomTextL: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 14)
        label.textColor = .white
        label.text = "了解更多"
        label.textAlignment = .center
//        label.backgroundColor = UIColor(red: 249, green: 212, blue: 135)

        label.layer.cornerRadius = 17
        label.layer.masksToBounds = true
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.white.cgColor
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(topTextL)
        self.addSubview(bottomTextL)
        
        self.topTextL.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.centerX.equalTo(self)
            make.width.lessThanOrEqualTo(self)
        }
        
        self.bottomTextL.snp.makeConstraints { make in
            make.bottom.equalTo(-16)
            make.width.greaterThanOrEqualTo(98)
            make.height.equalTo(34)
            make.centerX.equalTo(self)
            make.top.equalTo(self.topTextL.snp.bottom).offset(30)
            
        }
    }


}
