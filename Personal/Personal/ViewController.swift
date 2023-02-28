//
//  ViewController.swift
//  Personal
//
//  Created by wangbinji on 2023/2/28.
//

import UIKit
import SnapKit
import SwiftyJSON
import Combine

protocol ModelProtocol {
    
}

class ViewController: UIViewController {
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 20)
        label.textAlignment = .center
        label.textColor = .green
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textLabel.text = "Hello World!"
        self.view.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.center.equalTo(self.view)
        }
    }


}

