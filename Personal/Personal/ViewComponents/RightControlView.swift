//
//  RightControlView.swift
//  Personal
//
//  Created by wangbinji on 2023/3/9.
//

import UIKit

enum RightEvents {
    case Camera
    case Record
}

class RightControlView: UIView {
    
    var events: ((RightEvents)->Void)?
    
    convenience init(events eventsBlock: @escaping (RightEvents)->Void) {
        self.init()
        
        self.events = eventsBlock
    }
    
    @IBOutlet weak var cameraBtn: UIButton!
    
    @IBOutlet weak var recordBtn: UIButton!
    
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBAction func cameraAction(_ sender: UIButton) {
        print("camera action")
        
        if self.events != nil {
            self.events!(.Camera)
        }
        
    }
    @IBAction func recordBtn(_ sender: UIButton) {
        print("record action")
        
        if self.events != nil {
            self.events!(.Record)
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
    
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor]
        layer.locations = [0, 1]
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        return layer
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
        contentView.layer.addSublayer(gradientLayer)
        
        addSubview(contentView)
        
        configureStyle()
        configureLayout()
    }
    
    func configureStyle() {
        contentView.backgroundColor = .clear
        
        self.cameraBtn.backgroundColor = .black.withAlphaComponent(0.4)
        self.cameraBtn.layer.cornerRadius = 22
        self.cameraBtn.layer.masksToBounds = true
        self.cameraBtn.setTitle("", for: .normal)
        
        self.recordBtn.backgroundColor = .black.withAlphaComponent(0.4)
        self.recordBtn.layer.cornerRadius = 22
        self.recordBtn.layer.masksToBounds = true
        self.recordBtn.setTitle("", for: .normal)
    }
    
    func configureLayout() {
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(self)
            make.width.lessThanOrEqualToSuperview()
        }
        
        self.stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.bottom.equalTo(contentView)
            make.center.equalTo(contentView)
            make.width.equalTo(40)
            
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //        gradientLayer.frame = self.bounds
    }
    
    
    
}
