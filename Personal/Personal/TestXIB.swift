//
//  TestXIB.swift
//  Personal
//
//  Created by wangbinji on 2023/3/7.
//

import UIKit

class TestXIB: UIView {

    @IBOutlet weak var UserNameF: UITextField!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        
    }
    
}
