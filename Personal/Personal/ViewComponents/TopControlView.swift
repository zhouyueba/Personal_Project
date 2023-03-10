//
//  TopControlView.swift
//  Personal
//
//  Created by wangbinji on 2023/3/9.
//

import UIKit

protocol TopControlViewDelegate: NSObjectProtocol {
    func events(events: TopEvents)
}

enum TopEvents {
    case Back
    case Volume
    case More
}

class TopControlView: UIView {
    
    weak var delegate: TopControlViewDelegate?
    
    @IBOutlet weak var showMoreBtn: UIButton!
    @IBOutlet weak var liveView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var voiceBtn: UIButton!
    
    @IBOutlet weak var topRedImgV: UIImageView!
    @IBOutlet weak var tipsTextL: UILabel!
    @IBAction func pressBackAction(_ sender: UIButton) {
        print("back")
        self.delegate?.events(events: .Back)
    }
    
    @IBAction func pressVoiceAction(_ sender: Any) {
        print("volume")
        
        self.delegate?.events(events: .Volume)
    }
    
    @IBAction func showMoreAction(_ sender: UIButton) {
        print("show more")
        
        self.delegate?.events(events: .More)
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
        layer.startPoint = CGPoint(x: 0.5, y: 0)
        layer.endPoint = CGPoint(x: 0.5, y: 1)
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
        self.layer.addSublayer(gradientLayer)
        
        addSubview(contentView)
        
        configureStyle()
        configureLayout()
    }
    
    func configureStyle() {
        contentView.backgroundColor = .clear
        
        liveView.backgroundColor = .black
        liveView.layer.cornerRadius = 13
        liveView.layer.masksToBounds = true
        
        self.topRedImgV.layer.cornerRadius = 3
        self.topRedImgV.layer.masksToBounds = true
        
        self.backBtn.setTitle("", for: .normal)
        self.voiceBtn.setTitle("", for: .normal)
        
    }
    
    func configureLayout() {
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(self)
            make.width.lessThanOrEqualToSuperview()
        }
        
        self.backBtn.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.size.equalTo(CGSize(width: 40, height: 40))
            make.left.equalTo(16)
        }
        
        
        self.showMoreBtn.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-16)
        }
        
        self.voiceBtn.snp.makeConstraints { make in
            make.right.equalTo(self.showMoreBtn.snp.left).offset(-16)
            make.centerY.equalTo(contentView)
        }
        
        self.liveView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self.backBtn.snp.right).offset(0)
            make.width.greaterThanOrEqualTo(66)
            make.height.equalTo(24)
        }
        
        self.topRedImgV.snp.makeConstraints { make in
            make.left.equalTo(9)
            make.size.equalTo(CGSize(width: 6, height: 6))
            make.centerY.equalTo(self.liveView)
        }
        
        self.tipsTextL.snp.makeConstraints { make in
            make.left.equalTo(self.topRedImgV.snp.right).offset(9)
            make.right.equalTo(self.liveView).offset(-9)
            make.centerY.equalTo(self.liveView)
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = self.bounds
    }
    
}
