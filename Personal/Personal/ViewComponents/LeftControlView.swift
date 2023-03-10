//
//  LeftControlView.swift
//  Personal
//
//  Created by wangbinji on 2023/3/9.
//

import UIKit

enum LeftEvents {
    case AddFood
    case Voice
}

protocol LeftControlViewDelegate: NSObjectProtocol {
    func events(events: LeftEvents)
}

class LeftControlView: UIView {
    
    weak var delegate: LeftControlViewDelegate?
    
    @IBOutlet weak var addFoodBtn: UIButton!
    
    @IBOutlet weak var voiceBtn: UIButton!
    
    
    @IBOutlet weak var stackView: UIStackView!
    @IBAction func addFoodAction(_ sender: UIButton) {
        print("add food")
        
        self.delegate?.events(events: .AddFood)
    }
    @IBAction func voiceAction(_ sender: UIButton) {
        print("voice action")
        
        self.delegate?.events(events: .Voice)
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
        layer.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor]
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
        
        self.addFoodBtn.backgroundColor = .black.withAlphaComponent(0.4)
        self.addFoodBtn.layer.cornerRadius = 22
        self.addFoodBtn.setTitle("", for: .normal)
        
        self.voiceBtn.backgroundColor = .black.withAlphaComponent(0.4)
        self.voiceBtn.layer.cornerRadius = 22
        self.voiceBtn.setTitle("", for: .normal)
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
