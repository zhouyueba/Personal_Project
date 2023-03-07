//
//  CommonCell.swift
//  Personal
//
//  Created by wangbinji on 2023/3/6.
//

import Foundation
import UIKit

// Cell
class BaseCell: UITableViewCell {
    
    var viewModel: BaseViewModel?
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        
    }
    
    func bindViewModel(_ viewModel: BaseViewModel) {
        self.viewModel = viewModel
    }
}

// 视频
class VideoCell: BaseCell {
    
    // 视频播放View
    lazy var placeView: UIView = {
        let placeView = UIView()
        placeView.backgroundColor = .black
        return placeView
    }()
    
    override func setUI() {

        self.contentView.addSubview(self.bgView)
        self.bgView.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-8)
            make.top.equalTo(self.contentView.snp.top).offset(8)
            make.width.equalTo(self.contentView)
            make.centerX.equalTo(self.contentView)
        }
        
        self.bgView.addSubview(placeView)
        placeView.snp.makeConstraints { make in
            make.width.equalTo(self.bgView)
            make.top.equalTo(self.bgView.snp.top).offset(0)
            make.bottom.equalTo(self.bgView.snp.bottom).offset(0)
            make.height.equalTo(214)
        }
        
    }
}

// 故障
class ErrorCell: BaseCell {
    
    lazy var leftImgView: UIImageView = {
        let imageV = UIImageView()
        imageV.backgroundColor = .orange
        return imageV
    }()
    
    lazy var textL: UILabel = {
        let textL = UILabel()
        textL.numberOfLines = 0
        textL.text = "两桶缺粮啦。请及时添加两桶缺粮啦。请及时添加两桶缺粮啦。请及时添加"
        textL.textAlignment = .left
        textL.font = UIFont(name: "", size: 14)
        return textL
    }()
    
    lazy var rightIcon: UIImageView = {
        let imageV = UIImageView()
        imageV.backgroundColor = .red
        return imageV
    }()
   
    override func setUI() {
        
        
        self.bgView.backgroundColor = UIColor(red: 243, green: 110, blue: 0)
        
        self.contentView.addSubview(self.bgView)
        self.bgView.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView.snp_bottomMargin).offset(-8)
            make.top.equalTo(self.contentView.snp_topMargin).offset(8)
            make.width.equalTo(self.contentView)
            make.centerX.equalTo(self.contentView)
        }
        
        self.bgView.addSubview(leftImgView)
        self.leftImgView.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.centerY.equalTo(self.bgView)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        self.bgView.addSubview(rightIcon)
        rightIcon.snp.makeConstraints { make in
            make.right.equalTo(self.bgView.snp.right).offset(-16)
            make.centerY.equalTo(self.bgView)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        self.bgView.addSubview(textL)
        textL.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.left.equalTo(leftImgView.snp.right).offset(16)
            make.right.lessThanOrEqualTo(rightIcon.snp.left)
//            make.width.lessThanOrEqualTo(self.bgView).offset(-120)
        }
    }
}

// 卡片
class CardCell: BaseCell {
    
    lazy var leftCard: CardView = {
        let card = CardView()
        card.layer.cornerRadius = 12
        card.backgroundColor = .white
        card.layer.masksToBounds = true
        return card
    }()
    
    lazy var middleCard: CardView = {
        let card = CardView()
        card.layer.cornerRadius = 12
        card.backgroundColor = .white
        card.layer.masksToBounds = true
        return card
    }()
    
    lazy var rightCard: CardView = {
        let card = CardView()
        card.layer.cornerRadius = 12
        card.backgroundColor = .white
        card.layer.masksToBounds = true
        return card
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftCard, middleCard, rightCard])
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 12
        return stack
    }()
    
   
    override func setUI() {
        
        self.bgView.backgroundColor = .clear
        
        self.contentView.addSubview(self.bgView)
        self.bgView.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-8)
            make.top.equalTo(self.contentView.snp.top).offset(8)
            make.width.equalTo(self.contentView)
            make.centerX.equalTo(self.contentView)
            make.height.equalTo(82)
        }
        
        self.bgView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self.bgView)
        }
    }
}

// 进食或出粮
class EatOrFoodCell: BaseCell {
    
    @objc func pressBtn(sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    lazy var leftTimeL: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Bold", size: 16)
        label.text = "18:00"
        label.textAlignment = .left
        return label
    }()
    
    lazy var leftIconImgV: UIImageView = {
        let imageV = UIImageView()
        imageV.backgroundColor = .red
        return imageV
    }()
    
    lazy var contentL1: UILabel = {
        
        let title = "加餐已出粮"
        let subTitle = "共6份 [1仓 3份， 2仓 3份]"
        let totalTitle = "\(title) \n\(subTitle)"

        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 2
        
        let mutStr = NSMutableAttributedString(string: "\(title)\n\(subTitle)")
        
        mutStr.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: title.count, length: subTitle.count + 1))
        mutStr.addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: totalTitle.count-1))
        
        
        let label = UILabel()
        label.font = UIFont(name: "Semibold", size: 16)
        label.text = "\(title) \n\(subTitle)"
        label.attributedText = mutStr
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var imageV: UIImageView = {
        let imageV = UIImageView()
        imageV.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        return imageV
    }()

    override func setUI() {
        self.contentView.backgroundColor = .white
        self.bgView.backgroundColor = .white
        self.contentView.addSubview(self.bgView)
        self.bgView.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView.snp_bottomMargin).offset(-8)
            make.top.equalTo(self.contentView.snp_topMargin).offset(8)
            make.width.equalTo(self.contentView)
            make.centerX.equalTo(self.contentView)
//            make.height.equalTo(200)
        }
        
        self.bgView.addSubview(leftTimeL)
        leftTimeL.snp.makeConstraints { make in
            make.left.equalTo(14)
            make.top.equalTo(self.bgView)
        }
        
        self.bgView.addSubview(leftIconImgV)
        leftIconImgV.snp.makeConstraints { make in
            make.left.equalTo(leftTimeL.snp.right).offset(14)
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.centerY.equalTo(leftTimeL)
        }
        
        self.bgView.addSubview(contentL1)
        contentL1.snp.makeConstraints { make in
            make.left.equalTo(leftIconImgV.snp.right).offset(14)
            make.top.equalTo(leftIconImgV.snp.top)
            make.width.lessThanOrEqualTo(self.bgView).dividedBy(2)
            
        }
        
        self.bgView.addSubview(imageV)
        imageV.snp.makeConstraints { make in
            make.left.equalTo(contentL1)
            make.top.equalTo(contentL1.snp.bottom).offset(12)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(imageV.snp.width).multipliedBy(0.6)
            make.bottom.equalTo(-10)
        }
        
        self.bgView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.top.equalTo(leftIconImgV.snp.bottom).offset(10)
            make.centerX.equalTo(leftIconImgV)
            make.width.equalTo(1)
            make.bottom.equalTo(self.bgView).offset(33)
        }
    }
}

class PlanOrAddFoldCell: BaseCell {
        
    @objc func pressBtn(sender: UIButton) {
        
        let viewModel = self.viewModel as? PlanOrAddFoldViewModel
        
        if viewModel?.foldEvents != nil {
            viewModel!.foldEvents!(1)
        }
    }
    
    lazy var leftTimeL: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Bold", size: 16)
        label.text = "18:00"
        label.textAlignment = .left
        return label
    }()
    
    lazy var leftIconImgV: UIImageView = {
        let imageV = UIImageView()
        imageV.backgroundColor = .red
        return imageV
    }()
    
    lazy var contentL1: UILabel = {
        
        let title = "加餐已出粮"
        let subTitle = "共6份 [1仓 3份， 2仓 3份]"
        let totalTitle = "\(title) \n\(subTitle)"

        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 2
        
        let mutStr = NSMutableAttributedString(string: "\(title)\n\(subTitle)")
        
        mutStr.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: title.count, length: subTitle.count + 1))
        mutStr.addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: totalTitle.count-1))
        
        
        let label = UILabel()
        label.font = UIFont(name: "Semibold", size: 16)
        label.text = "\(title) \n\(subTitle)"
        label.attributedText = mutStr
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var foldBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("fold", for: .normal)
        button.setTitle("unFold", for: .selected)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.addTarget(self, action: #selector(self.pressBtn), for: .touchUpInside)
        button.isSelected = false
        return button
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    override func setUI() {
        self.contentView.backgroundColor = .white
        self.bgView.backgroundColor = .white
        self.contentView.addSubview(self.bgView)
        self.bgView.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView.snp_bottomMargin).offset(-8)
            make.top.equalTo(self.contentView.snp_topMargin).offset(8)
            make.width.equalTo(self.contentView)
            make.centerX.equalTo(self.contentView)
        }
        
        self.bgView.addSubview(leftTimeL)
        leftTimeL.snp.makeConstraints { make in
            make.left.equalTo(14)
            make.top.equalTo(self.bgView)
        }
        
        self.bgView.addSubview(leftIconImgV)
        leftIconImgV.snp.makeConstraints { make in
            make.left.equalTo(leftTimeL.snp.right).offset(14)
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.centerY.equalTo(leftTimeL)
        }
        
        self.bgView.addSubview(foldBtn)
        foldBtn.snp.makeConstraints { make in
            make.right.equalTo(self.bgView).offset(-14)
            make.centerY.equalTo(leftTimeL)
        }
        
        self.bgView.addSubview(contentL1)
        contentL1.snp.makeConstraints { make in
            make.left.equalTo(leftIconImgV.snp.right).offset(14)
            make.top.equalTo(leftIconImgV.snp.top)
            make.width.lessThanOrEqualTo(self.bgView).dividedBy(2)
            make.bottom.equalTo(-10)
        }
        
        self.bgView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.top.equalTo(leftIconImgV.snp.bottom).offset(10)
            make.centerX.equalTo(leftIconImgV)
            make.width.equalTo(1)
            make.bottom.equalTo(self.bgView).offset(33)
        }
    }
    
    override func bindViewModel(_ viewModel: BaseViewModel) {
        super.bindViewModel(viewModel)
        
    }
    
    
}

class PlanOrAddUnFoldCell: BaseCell {
        
    @objc func pressBtn(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        let viewModel = self.viewModel as? PlanOrAddUnFoldViewModel
        
        if viewModel?.unFoldEvents != nil {
            viewModel!.unFoldEvents!(viewModel?.indexPath?.row ?? 999)
        }
    }
    
    lazy var leftTimeL: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Bold", size: 16)
        label.text = "18:00"
        label.textAlignment = .left
        return label
    }()
    
    lazy var leftIconImgV: UIImageView = {
        let imageV = UIImageView()
        imageV.backgroundColor = .red
        return imageV
    }()
    
    lazy var contentL1: UILabel = {
        
        let title = "加餐已出粮"
        let subTitle = "共6份 [1仓 3份， 2仓 3份]"
        let totalTitle = "\(title) \n\(subTitle)"

        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 2
        
        let mutStr = NSMutableAttributedString(string: "\(title)\n\(subTitle)")
        
        mutStr.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: title.count, length: subTitle.count + 1))
        mutStr.addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: totalTitle.count-1))
        
        
        let label = UILabel()
        label.font = UIFont(name: "Semibold", size: 16)
        label.text = "\(title) \n\(subTitle)"
        label.attributedText = mutStr
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var foldBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("fold", for: .normal)
        button.setTitle("unFold", for: .selected)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.addTarget(self, action: #selector(self.pressBtn), for: .touchUpInside)
        button.isSelected = true
        return button
    }()
    
    lazy var swView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 254, green: 249, blue: 247)
        let leftTitle = UILabel()
        leftTitle.font = UIFont(name: "Semibold", size: 16)
        leftTitle.numberOfLines = 0
        leftTitle.text = "待出粮"
        leftTitle.textAlignment = .left
        leftTitle.textColor = UIColor(red: 249, green: 83, blue: 0)
        view.addSubview(leftTitle)
        leftTitle.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.width.lessThanOrEqualToSuperview().multipliedBy(0.3)
        }
        
        let rightSw = UISwitch()
        view.addSubview(rightSw)
        rightSw.snp.makeConstraints { make in
            make.right.equalTo(view).offset(-16)
            make.centerY.equalTo(leftTitle)
        }
        
        
        return view
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()

    override func setUI() {
        self.contentView.backgroundColor = .white
        self.bgView.backgroundColor = .white
        self.contentView.addSubview(self.bgView)
        self.bgView.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView.snp_bottomMargin).offset(-8)
            make.top.equalTo(self.contentView.snp_topMargin).offset(8)
            make.width.equalTo(self.contentView)
            make.centerX.equalTo(self.contentView)
        }
        
        self.bgView.addSubview(leftTimeL)
        leftTimeL.snp.makeConstraints { make in
            make.left.equalTo(14)
            make.top.equalTo(self.bgView)
        }
        
        self.bgView.addSubview(leftIconImgV)
        leftIconImgV.snp.makeConstraints { make in
            make.left.equalTo(leftTimeL.snp.right).offset(14)
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.centerY.equalTo(leftTimeL)
        }
        
        self.bgView.addSubview(foldBtn)
        foldBtn.snp.makeConstraints { make in
            make.right.equalTo(self.bgView).offset(-14)
            make.centerY.equalTo(leftTimeL)
        }
        
        self.bgView.addSubview(contentL1)
        contentL1.snp.makeConstraints { make in
            make.left.equalTo(leftIconImgV.snp.right).offset(14)
            make.top.equalTo(leftIconImgV.snp.top)
            make.width.lessThanOrEqualTo(self.bgView).dividedBy(2)
        }
        
        self.bgView.addSubview(swView)
        swView.snp.makeConstraints { make in
            make.left.equalTo(contentL1)
            make.top.equalTo(contentL1.snp.bottom).offset(12)
            make.right.equalTo(bgView.snp.right).offset(-16)
            make.bottom.equalTo(-10)
        }
        
        self.bgView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.top.equalTo(leftIconImgV.snp.bottom).offset(10)
            make.centerX.equalTo(leftIconImgV)
            make.width.equalTo(1)
            make.bottom.equalTo(self.bgView).offset(33)
        }
    }
    
    override func bindViewModel(_ viewModel: BaseViewModel) {
        super.bindViewModel(viewModel)
        
        if let viewModel = viewModel as? PlanOrAddUnFoldViewModel {
            
            self.foldBtn.isSelected = !viewModel.isFold
            
            if viewModel.isFold {
                
                UIView.animate(withDuration: 0.2) {
                    self.swView.alpha = 0
                    self.swView.snp.updateConstraints { make in
                        make.top.equalTo(self.contentL1.snp.bottom).offset(-44)
                    }
                }
            } else {
                
                UIView.animate(withDuration: 0.2) {
                    self.swView.alpha = 1
                    self.swView.snp.updateConstraints { make in
                        make.top.equalTo(self.contentL1.snp.bottom).offset(12)
                    }
                }
            }
        }
    }
}




