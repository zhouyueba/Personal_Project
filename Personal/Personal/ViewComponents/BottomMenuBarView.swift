//
//  BottomMenuBarView.swift
//  Personal
//
//  Created by wangbinji on 2023/3/10.
//

import UIKit

protocol BottomMenuBarViewDelegate: NSObjectProtocol {
    func events(events: BottomMenuEvents)
}

enum BottomMenuEvents {
    case AddFood
    case VoiceTap
    case VoiceBegin
    case VoiceEnd
    case FeedPlan
    case Vlog
}


class BottomMenuCell: UICollectionViewCell {
    
    lazy var titleL: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 12)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Menu"
        return label
    }()
    
    lazy var imgV: UIImageView = {
        let imgV = UIImageView()
        imgV.backgroundColor = .red
        return imgV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(imgV)
        imgV.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(self.contentView).offset(0)
        }
        
        self.contentView.addSubview(titleL)
        titleL.snp.makeConstraints { make in
            make.top.equalTo(imgV.snp.bottom).offset(10)
            make.width.lessThanOrEqualToSuperview()
            make.centerX.equalTo(self.contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindViewModel(viewModel: TabBarCCellViewModel) {
        
        if viewModel.isSelect {
            
        } else {
           
        }
        
        self.titleL.text = viewModel.title
    }
}


class BottomMenuBarView: UIView {
    weak var delegate: BottomMenuBarViewDelegate?
    
    let data = [TabBarCCellViewModel(title: "立即加餐", isSelect: true),
                 TabBarCCellViewModel(title: "对讲", isSelect: false),
                 TabBarCCellViewModel(title: "喂食计划", isSelect: false),
                 TabBarCCellViewModel(title: "Vlog", isSelect: false)]
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 375 / 4, height: 68)
        flowLayout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(BottomMenuCell.self, forCellWithReuseIdentifier: "TabBarCCellViewModel")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
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
        self.backgroundColor = .white
        self.addSubview(collectionView)
        
        configureStyle()
        configureLayout()
    }
    
    func configureStyle() {
        
    }
    
    func configureLayout() {
        
        collectionView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.width.equalTo(self).offset(-32)
            make.top.equalTo(self).offset(15)
            make.height.equalTo(68)
            make.bottom.equalTo(self).offset(-32)
        }
    }
}

extension BottomMenuBarView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    @objc func longPressVoice(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            self.delegate?.events(events: .VoiceBegin)
            print("hello world")
        }
        
        if sender.state == .ended || sender.state == .cancelled {
            self.delegate?.events(events: .VoiceEnd)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let viewModel = self.data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.reuseIdentifier(), for: indexPath) as? BottomMenuCell
        cell?.bindViewModel(viewModel: viewModel)
        
        if let cell = cell {
            let gesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressVoice))
            gesture.minimumPressDuration = 0.5
            gesture.numberOfTouchesRequired = 1
            cell.addGestureRecognizer(gesture)
            
        }
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            self.delegate?.events(events: .AddFood)
        }
        
        if indexPath.row == 1 {
            
            self.delegate?.events(events: .VoiceTap)
        }
        
        if indexPath.row == 2 {
            self.delegate?.events(events: .FeedPlan)
        }
        
        if indexPath.row == 3 {
            self.delegate?.events(events: .Vlog)
        }
    }
}
