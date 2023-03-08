//
//  VideoOutDateView.swift
//  Personal
//
//  Created by wangbinji on 2023/3/7.
//

import UIKit

class VideoOutDateView: UIView {
    
    private var viewModel: VideoOutDateViewModel?
    
    @IBOutlet weak var topTipsL: UILabel!
    @IBOutlet weak var bottomBtn: UIButton!
    
    @IBAction func learnMore(_ sender: UIButton) {
        print("learn more")
        
        self.viewModel?.learnMore()
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
        
        self.bottomBtn.layer.cornerRadius = 17
        self.bottomBtn.layer.masksToBounds = true
        self.bottomBtn.layer.borderWidth = 1
        self.bottomBtn.layer.borderColor = UIColor.white.cgColor
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

extension VideoOutDateView: StatusViewProrocol {
    
    func bind(viewModel: BaseViewModel) {
        
        if let viewModel = viewModel as? VideoOutDateViewModel {
            self.topTipsL.text = viewModel.topText
            self.bottomBtn.setTitle(viewModel.bottomText, for: .normal)
        }
    }
}
