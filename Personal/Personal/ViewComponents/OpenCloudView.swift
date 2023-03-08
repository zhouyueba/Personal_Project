//
//  OpenCloudView.swift
//  Personal
//
//  Created by wangbinji on 2023/3/7.
//

import UIKit

class OpenCloudView: UIView {
    
    private var viewModel: OpenCloudViewModel?

    @IBOutlet weak var topTextL: UILabel!
    
    @IBOutlet weak var bottomBtn: UIButton!
    
    @IBAction func openCloud(_ sender: UIButton) {
        
//        print("open cloud")
        
        self.viewModel?.openCloud()
        
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
        self.bottomBtn.setTitleColor(UIColor(red: 113, green: 48, blue: 6), for: .normal)
        self.bottomBtn.backgroundColor = UIColor(red: 249, green: 212, blue: 135)
        self.bottomBtn.layer.cornerRadius = 17
    }
    
    func configureLayout() {
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(self)
            make.width.lessThanOrEqualToSuperview()
        }
        
        self.topTextL.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.centerX.equalTo(contentView)
            make.width.lessThanOrEqualTo(self).offset(-32)
        }

        self.bottomBtn.snp.makeConstraints { make in
            make.bottom.equalTo(-16)
            make.width.greaterThanOrEqualTo(98)
            make.height.equalTo(34)
            make.centerX.equalTo(contentView)
            make.top.equalTo(self.topTextL.snp.bottom).offset(30)
        }
    }
}

extension OpenCloudView: StatusViewProrocol {
    
    func bind(viewModel: BaseViewModel) {
        
        if let viewModel = viewModel as? OpenCloudViewModel {
            
            self.viewModel = viewModel
            
            self.topTextL.text = viewModel.topText
            self.bottomBtn.setTitle(viewModel.bottomText, for: .normal)
        }
    }
}
