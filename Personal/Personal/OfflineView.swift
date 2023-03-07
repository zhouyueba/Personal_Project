//
//  OfflineView.swift
//  Personal
//
//  Created by wangbinji on 2023/3/7.
//

import UIKit

class OfflineView: UIView {

    lazy var topTextL: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 14)
        label.text = "出粮"
        label.textAlignment = .left
        return label
    }()
    
    lazy var bottomTextL: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 22)
        label.text = "6份"
        label.textAlignment = .left
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
            make.left.equalTo(16)
            make.width.lessThanOrEqualTo(self)
        }
        
        self.bottomTextL.snp.makeConstraints { make in
            make.bottom.equalTo(-16)
            make.width.lessThanOrEqualTo(self)
            make.left.equalTo(16)
        }
    }


}
