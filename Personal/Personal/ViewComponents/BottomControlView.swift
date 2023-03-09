//
//  BottomControlView.swift
//  Personal
//
//  Created by wangbinji on 2023/3/9.
//

import UIKit

enum BottomEvent {
    case ChangeQuality
    case ShowEatLive
    case BackToLive
    case PlayVideo
    case BeginSlide
    case Sliding
    case EndSlide
}

class BottomControlView: UIView {
    
    var bottomControlViewEvents: ((BottomEvent)->Void)?
    
    
    convenience init(events eventsBlock: @escaping (BottomEvent)->Void) {
        self.init()
        
        self.bottomControlViewEvents = eventsBlock
    }
    
    
    @IBOutlet weak var progressView: UISlider!
    @IBOutlet weak var endTimeL: UILabel!
    @IBOutlet weak var startTimeL: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var qualityBtn: UIButton!
    
    @IBOutlet weak var backToLiveBtn: UIButton!
    @IBOutlet weak var eatLiveBtn: UIButton!
    @IBAction func changeQualityAction(_ sender: UIButton) {
        
        print("change quality")
        
        if self.bottomControlViewEvents != nil {
            self.bottomControlViewEvents!(.ChangeQuality)
        }
        
    }
    @IBAction func showEatLiveAction(_ sender: UIButton) {
        
        print("show eat live")
        
        if self.bottomControlViewEvents != nil {
            self.bottomControlViewEvents!(.ShowEatLive)
        }
    }
    @IBAction func backToLiveAction(_ sender: UIButton) {
        print("back to live")
        
        if self.bottomControlViewEvents != nil {
            self.bottomControlViewEvents!(.BackToLive)
        }
    }
    
    @IBAction func palyVideo(_ sender: UIButton) {
        print("play video")
        
        if self.bottomControlViewEvents != nil {
            self.bottomControlViewEvents!(.PlayVideo)
        }
    }
    @IBAction func slideChange(_ sender: UISlider) {
        print("slideing...")
        
        if self.bottomControlViewEvents != nil {
            self.bottomControlViewEvents!(.Sliding)
        }
    }
    @IBAction func beginSlideAction(_ sender: UISlider) {
        print("begin slide")
        
        if self.bottomControlViewEvents != nil {
            self.bottomControlViewEvents!(.BeginSlide)
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
        
        self.playBtn.contentHorizontalAlignment = .left
        self.playBtn.setTitle("", for: .normal)
        self.backToLiveBtn.backgroundColor = .black.withAlphaComponent(0.4)
        self.backToLiveBtn.layer.cornerRadius = 16
    }
    
    func configureLayout() {
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(self)
            make.width.lessThanOrEqualToSuperview()
        }
        
        self.stackView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView).offset(20)
            make.right.equalTo(contentView).offset(-16)
        }
        
        self.playBtn.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.centerY.equalTo(self.stackView)
        }
        
        self.backToLiveBtn.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(68)
            make.height.equalTo(32)
            make.left.equalTo(self.playBtn.snp.right).offset(16)
            make.centerY.equalTo(self.playBtn)
        }
        
        self.startTimeL.snp.makeConstraints { make in
            make.left.equalTo(self.playBtn).offset(16)
            make.bottom.equalTo(self.playBtn.snp.top).offset(-20)
            make.width.lessThanOrEqualTo(35)
        }
        
        self.progressView.snp.makeConstraints { make in
            make.left.equalTo(self.startTimeL.snp.right).offset(16)
            make.centerY.equalTo(self.startTimeL)
            make.right.equalTo(self.endTimeL.snp.left).offset(-16)
        }
        
        self.endTimeL.snp.makeConstraints { make in
            make.right.equalTo(self.stackView)
            make.centerY.equalTo(self.startTimeL)
            make.width.lessThanOrEqualTo(35)
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = self.bounds
    }
    
}
