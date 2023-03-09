//
//  OpenCameraView.swift
//  Personal
//
//  Created by wangbinji on 2023/3/7.
//

import UIKit

enum OpenCameraEvents {
    case OpenCamera
}

class OpenCameraView: UIView {
    
    var events: ((OpenCameraEvents)->Void)?
    
    convenience init(events event: @escaping (OpenCameraEvents)->Void) {
        self.init()
        self.events = event
    }
    
    @IBOutlet weak var topTipsL: UILabel!
    @IBOutlet weak var bottomBtn: UIButton!
    
    @IBAction func openCamera(_ sender: UIButton) {
        print("open camera")
        
        if self.events != nil {
            self.events!(.OpenCamera)
        }
    }
    
    lazy var contentView: UIView = {
        
        let className = type(of: self)
        let bundle = Bundle(for: className)
        let name = NSStringFromClass(className).components(separatedBy: ".").last
        let nib = UINib(nibName: name!, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configurePage()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configurePage()
    }
    
    func configurePage() {
        addSubview(contentView)
        
        configureStyle()
        configureLayout()
    }
    
    func configureStyle() {
        
    }
    
    func configureLayout() {
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(self)
            make.width.lessThanOrEqualToSuperview()
        }
        
        self.topTipsL.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.centerX.equalTo(contentView)
            make.width.lessThanOrEqualTo(self).offset(-32)
        }
        
        self.bottomBtn.snp.makeConstraints { make in
            make.bottom.equalTo(-16)
            make.width.greaterThanOrEqualTo(98)
            make.height.equalTo(34)
            make.centerX.equalTo(contentView)
            make.top.equalTo(self.topTipsL.snp.bottom).offset(30)
        }
    }
}
