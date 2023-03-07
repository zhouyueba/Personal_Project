//
//  CommonView.swift
//  Personal
//
//  Created by wangbinji on 2023/3/6.
//

import Foundation
import UIKit
import Combine

class CardView: UIView {
    
    lazy var topTextL: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 14)
        label.text = "出粮"
        label.textAlignment = .left
        return label
    }()
    
    lazy var bottomTextL: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 22)
        label.text = "6份"
        label.textAlignment = .left
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(topTextL)
        self.addSubview(bottomTextL)
        
        self.topTextL.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.left.equalTo(16)
            make.width.lessThanOrEqualTo(self)
        }
        
        self.bottomTextL.snp.makeConstraints { make in
            make.bottom.equalTo(-16)
            make.width.lessThanOrEqualTo(self)
            make.left.equalTo(16)
        }
    }
}

class TabBarCCell: UICollectionViewCell {
    
    lazy var titleL: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 16)
        label.textColor = UIColor(red: 249, green: 83, blue: 0)
        label.textAlignment = .left
        label.text = "Hello"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(titleL)
        titleL.snp.makeConstraints { make in
            make.edges.equalTo(self.contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindViewModel(viewModel: TabBarCCellViewModel) {
        
        if viewModel.isSelect {
            self.titleL.font = UIFont(name: "", size: 30)
        } else {
            self.titleL.font = UIFont(name: "", size: 16)
        }
        
        
        self.titleL.text = viewModel.title
        self.titleL.textColor = viewModel.isSelect ? UIColor(red: 249, green: 83, blue: 0) : UIColor(red: 167, green: 167, blue: 167)
    }

}

class TabBarCCellViewModel: BaseViewModel {
    
    var title: String = ""
    var isSelect: Bool = false
    
    override func reuseIdentifier() -> String {
        return "TabBarCCellViewModel"
    }
    
    init(title: String, isSelect: Bool) {
        self.title = title
        self.isSelect = isSelect
    }
}

class TapBarView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let data = [TabBarCCellViewModel(title: "全部全部全部100", isSelect: true),
                 TabBarCCellViewModel(title: "宠物200", isSelect: false),
                 TabBarCCellViewModel(title: "进食999", isSelect: false),
                 TabBarCCellViewModel(title: "活动300", isSelect: false),
                 TabBarCCellViewModel(title: "工作工作工作工作工作234", isSelect: false)]
    

    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 12
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(TabBarCCell.self, forCellWithReuseIdentifier: "TabBarCCellViewModel")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let viewModel = self.data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.reuseIdentifier(), for: indexPath) as? TabBarCCell
        cell?.bindViewModel(viewModel: viewModel)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        for (i, value) in self.data.enumerated() {
            if i == indexPath.row {
                value.isSelect = true
            } else {
                value.isSelect = false
            }
        }
        collectionView.reloadData()
    }
    
    lazy var titleL: UILabel = {
        let label = UILabel()
        label.text = "今日吃播"
        label.textAlignment = .left
        label.font = UIFont(name: "Semibold", size: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.axis = .horizontal
        stack.spacing = 18
        return stack
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleL)
        titleL.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.left.equalTo(self)
        }
        
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleL.snp.bottom).offset(17)
            make.height.equalTo(50)
            make.bottom.equalTo(-16)
            make.width.greaterThanOrEqualToSuperview()
            make.centerX.equalTo(self)
        }
    }
}

class BottomControl: UIView {
    
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gradientLayer.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        layer.addSublayer(gradientLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = self.bounds
    }
}

class MiddleControl: UIView {
    
    @objc func pressLeftBtn() {
    
        
        
    }
    
    @objc func pressMiddleBtn() {
        
    }
    
    @objc func pressRightBtn() {
        
    }
    

    
    lazy var leftBtn: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("Left", for: .normal)
//        button.setImage(UIImage(systemName: "arrowtriangle.left.fill"), for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(self.pressLeftBtn), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.isSelected = false
        return button
    }()
    
    lazy var middleBtn: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("Play", for: .normal)
//        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(self.pressMiddleBtn), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.isSelected = false
        return button
    }()
    
    lazy var rightBtn: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("Right", for: .normal)
//        button.setImage(UIImage(systemName: "arrowtriangle.right.fill"), for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(self.pressRightBtn), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.isSelected = false
        return button
    }()
    
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftBtn, middleBtn, rightBtn])
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 18
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TopControl: UIView {
    
    @objc func pressLeftBtn() {
        
    }
    
    @objc func pressMiddleBtn() {
        
    }
    
    @objc func pressRightBtn() {
        
    }
    
    
    lazy var leftBtn: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("Left", for: .normal)
//        button.setImage(UIImage(systemName: "arrowtriangle.left.fill"), for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(self.pressLeftBtn), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.isSelected = false
        return button
    }()
    
    lazy var middleBtn: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("Play", for: .normal)
//        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(self.pressMiddleBtn), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.isSelected = false
        return button
    }()
    
    lazy var rightBtn: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("Play", for: .normal)
//        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(self.pressRightBtn), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.isSelected = false
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftBtn, middleBtn, rightBtn])
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 30
        stack.alignment = .center
        return stack
    }()
    
    
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gradientLayer.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        layer.addSublayer(gradientLayer)
        
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.right.equalTo(-16)
            make.top.equalTo(self)
            make.centerY.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = self.bounds
    }
}

@objc enum ControlType: Int {
    case Shot = 0
    case Record
    case Voice
    case Volume
    case Quality
    case Speed
    case AddFood
    case More
}

protocol CommonControlProtocol: NSObject {
    
    var viewModel: BaseViewModel? { get }
    
    var eventsBlock: ((ControlType)->Void)? { get }
    
    func bindViewModel(viewModel: BaseViewModel, eventsBlock: @escaping (ControlType)->Void)
}

class LeftControlViewModel: BaseViewModel {
    
    var qualityStr = "Hello"
    var speedStr = "World"
    
    init(qualityStr: String = "", speedStr: String = "") {
        self.qualityStr = qualityStr
        self.speedStr = speedStr
    }
    
    
}

class LeftControl: UIView, CommonControlProtocol {
    var viewModel: BaseViewModel?
      
    var eventsBlock: ((ControlType) -> Void)?
    
    var ob: NSKeyValueObservation?
    
    func bindViewModel(viewModel: BaseViewModel, eventsBlock: @escaping (ControlType) -> Void) {
        self.viewModel = viewModel
        self.eventsBlock = eventsBlock
        
        if let viewModel1: LeftControlViewModel = viewModel as? LeftControlViewModel {
            self.leftBtn.setTitle(viewModel1.qualityStr, for: .normal)
            self.middleBtn.setTitle(viewModel1.speedStr, for: .normal)
            
        }
    }
    

    
    @objc func pressLeftBtn() {
        if self.eventsBlock != nil {
            self.eventsBlock!(.Shot)
        }
    }
    
    @objc func pressMiddleBtn() {
        if self.eventsBlock != nil {
            self.eventsBlock!(.Record)
        }
    }
    
    lazy var leftBtn: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("Left", for: .normal)
//        button.setImage(UIImage(systemName: "arrowtriangle.left.fill"), for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(self.pressLeftBtn), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.isSelected = false
        return button
    }()
    
    lazy var middleBtn: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("Play", for: .normal)
//        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(self.pressMiddleBtn), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.isSelected = false
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftBtn, middleBtn])
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 30
        stack.alignment = .center
        return stack
    }()
    
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gradientLayer.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        layer.addSublayer(gradientLayer)
        
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = self.bounds
    }
}

class RightControl: UIView {
    
    @objc func pressLeftBtn() {
        
    }
    
    @objc func pressMiddleBtn() {
        
    }
    
    @objc func pressRightBtn() {
        
    }
    
    
    lazy var leftBtn: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("Left", for: .normal)
//        button.setImage(UIImage(systemName: "arrowtriangle.left.fill"), for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(self.pressLeftBtn), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.isSelected = false
        return button
    }()
    
    lazy var middleBtn: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("Play", for: .normal)
//        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(self.pressMiddleBtn), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.isSelected = false
        return button
    }()
    
    lazy var rightBtn: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("Play", for: .normal)
//        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(self.pressRightBtn), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.isSelected = false
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftBtn, middleBtn, rightBtn])
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 30
        stack.alignment = .center
        return stack
    }()
    
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gradientLayer.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        layer.addSublayer(gradientLayer)
        
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = self.bounds
    }
    
}

