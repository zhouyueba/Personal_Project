//
//  TopNavBarView.swift
//  Personal
//
//  Created by wangbinji on 2023/3/10.
//

import UIKit

protocol TopNavBarViewDelegate: NSObjectProtocol {
    func events(events: NavEvents)
}

enum NavEvents {
    case Back
    case Set
}

class TopNavBarView: UIView {
    
    weak var delegate: TopNavBarViewDelegate?
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var setBtn: UIButton!
    
    @IBOutlet weak var centerTitleL: UILabel!
    @IBOutlet weak var modeView: UIView!
    
    @IBOutlet weak var modeTextL: UILabel!
    
    @IBOutlet weak var modeImgV: UIImageView!
    
    @IBAction func setAction(_ sender: UIButton) {
        
        self.delegate?.events(events: .Set)
        
    }
    @IBAction func backAction(_ sender: UIButton) {
        
        self.delegate?.events(events: .Back)
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
        contentView.backgroundColor = .clear
        
    }
    
    func configureLayout() {
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        self.backBtn.snp.makeConstraints { make in
            make.left.equalTo(self).offset(16)
            make.bottom.equalTo(self).offset(-12)
        }
        
        self.setBtn.snp.makeConstraints { make in
            make.right.equalTo(self).offset(-16)
            make.bottom.equalTo(self).offset(-12)
        }
        
        self.modeView.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-5)
            make.centerX.equalTo(self)
        }
        
        self.modeTextL.snp.makeConstraints { make in
            make.left.equalTo(self.modeView)
            make.centerY.equalTo(self.modeView)
            make.top.equalTo(self.modeView)
            make.bottom.equalTo(self.modeView)
        }
        
        self.modeImgV.snp.makeConstraints { make in
            make.right.equalTo(self.modeView)
            make.left.equalTo(self.modeTextL.snp.right).offset(5)
            make.centerY.equalTo(self.modeView)
        }
        
        self.centerTitleL.snp.makeConstraints { make in
            
            make.bottom.equalTo(self.modeView.snp.top).offset(-6)
            make.centerX.equalTo(self)
        }
    }
}
