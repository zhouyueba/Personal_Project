//
//  ViewController.swift
//  Personal
//
//  Created by wangbinji on 2023/2/28.
//

import UIKit
import SnapKit
import SwiftyJSON
import Combine

protocol ModelProtocol {
    
}

protocol CellProtocol {
    
}

extension UIColor {
    // 新增初始化方法
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}

class Sects: NSObject {
    
    var rows: Array<BaseViewModel>
    
    init(rows: Array<BaseViewModel>) {
        self.rows = rows
    }
    
}

// ViewModel
class BaseViewModel: NSObject {
    func reuseIdentifier() -> String {
        return "BaseViewModel"
    }
    
    override init() {
        super.init()
    }
}

class VideoViewModel: BaseViewModel {
    override func reuseIdentifier() -> String {
        return "VideoViewModel"
    }
    
    override init() {
        super.init()
    }
}

class ErrorViewModel: BaseViewModel {
    override func reuseIdentifier() -> String {
        return "ErrorViewModel"
    }
    
    override init() {
        super.init()
    }
}

class CardViewModel: BaseViewModel {
    override func reuseIdentifier() -> String {
        return "CardViewModel"
    }
    
    override init() {
        super.init()
    }
}

class EatOrFoodViewModel: BaseViewModel {
    override func reuseIdentifier() -> String {
        return "EatOrFoodViewModel"
    }
    
    override init() {
        super.init()
    }
}



// Cell
class BaseCell: UITableViewCell {
    
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

class TapBarView: UIView {
    
    lazy var titleL: UILabel = {
        let label = UILabel()
        label.text = "今日吃播"
        label.textAlignment = .left
        label.font = UIFont(name: "Semibold", size: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
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
        
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleL.snp.bottom).offset(17)
            make.bottom.equalTo(-16)
            make.width.equalTo(self)
            make.centerX.equalTo(self)
        }
        
        for i in 0..<5 {
            let label = UILabel()
            label.text = "全部\(i + 9)"
            label.textAlignment = .left
            label.font = UIFont(name: "Semibold", size: 16)
            label.textColor = UIColor(red: 249, green: 83, blue: 0)
            stackView.insertArrangedSubview(label, at: 0)
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
        
        self.bgView.addSubview(imageV)
        imageV.snp.makeConstraints { make in
            make.left.equalTo(contentL1)
            make.top.equalTo(contentL1.snp.bottom).offset(12)
            make.size.equalTo(CGSize(width: 235, height: 146))
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

class ViewController: UIViewController {
    
    let fullPlayVC: FullPlayViewController = FullPlayViewController()
    
    var dataSource: Array<Sects> = []
    
    var isLandScape: Bool = false
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .plain)
        
        tableView.register(VideoCell.self, forCellReuseIdentifier: "VideoViewModel")
        tableView.register(ErrorCell.self, forCellReuseIdentifier: "ErrorViewModel")
        tableView.register(CardCell.self, forCellReuseIdentifier: "CardViewModel")
        tableView.register(EatOrFoodCell.self, forCellReuseIdentifier: "EatOrFoodViewModel")
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fullPlayVC.backBlockFunc { type in
            self.portraitLayout()
        }
        
        let topSect = Sects(rows: [VideoViewModel(), ErrorViewModel(), ErrorViewModel(), CardViewModel()])
        
        let bottomSect = Sects(rows: [EatOrFoodViewModel(), EatOrFoodViewModel(), EatOrFoodViewModel(), EatOrFoodViewModel(), EatOrFoodViewModel(), EatOrFoodViewModel(), EatOrFoodViewModel(), EatOrFoodViewModel()])
        
        self.dataSource.append(topSect)
        self.dataSource.append(bottomSect)
        
        self.view.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.showsVerticalScrollIndicator = false
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(self.view.snp_topMargin)
            make.bottom.equalTo(self.view.snp_bottomMargin)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(appBecomeActive), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func appBecomeActive() {
        
        if isLandScape {
            landScapeLayout()
        }
    }

    
    
    func landScapeLayout() {
        
        isLandScape = true
        
        setViewController(canLandscape: true)
        setViewController(isLanscape: true)
        
    
        self.view.addSubview(fullPlayVC.view)
        fullPlayVC.view.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
       
    }
    
    func portraitLayout() {
        
        isLandScape = false
        
        self.setViewController(canLandscape: false)
        self.setViewController(isLanscape: false)
        fullPlayVC.view.removeFromSuperview()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewModel = self.dataSource[indexPath.section].rows[indexPath.row]
        
        var baseCell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseIdentifier())
        if baseCell == nil {
            baseCell = UITableViewCell(style: .default, reuseIdentifier: viewModel.reuseIdentifier())
        }
        
        return baseCell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 1 ? "今日吃播" : ""
    }
    
    //    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return section == 4 ? 40 : 10
    //    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = TapBarView()
        return section == 1 ? view : UIView()
    }
    
    //    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    //        return section == 4 ? 40 : 100
    //    }
    //
    //    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //        let view = UIView()
    //        view.backgroundColor = .green
    //        return view
    //    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            cell.addSectionCorner(at: indexPath, radius: 16)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            
            landScapeLayout()
        }
    }
}

extension ViewController {

    func setViewController(canLandscape: Bool) {
        let myAppDelegate = UIApplication.shared.delegate as? AppDelegate
        myAppDelegate?.allowRotation = canLandscape
    }
    
    func setViewController(isLanscape: Bool) {
        
        if isLanscape {
            if #available(iOS 16.0, *) {
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeRight)) { error in
                    print(error)
                    
                }
                self.navigationController?.setNeedsUpdateOfSupportedInterfaceOrientations()
                self.setNeedsUpdateOfSupportedInterfaceOrientations()
            } else {
                // Fallback on earlier versions
                UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
            }
        } else {
            if #available(iOS 16.0, *) {
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
                self.navigationController?.setNeedsUpdateOfSupportedInterfaceOrientations()
                self.setNeedsUpdateOfSupportedInterfaceOrientations()
            } else {
                // Fallback on earlier versions
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            }
        }
    }
}


extension UITableViewCell {
    
    private func getTableView() -> UITableView? {
        if let tableView = self.superview as? UITableView {
            return tableView
        }
        if let tableView = self.superview?.superview as? UITableView {
            return tableView
        }
        return nil
    }
    
    func addSectionCorner(at indexPath: IndexPath, radius: CGFloat = 10) {
        let tableView = self.getTableView()!
        let rows = tableView.numberOfRows(inSection: indexPath.section)
        if indexPath.row == 0 || indexPath.row == rows - 1 {
            var corner: UIRectCorner
            if rows == 1 {
                corner = UIRectCorner.allCorners
            } else if indexPath.row == 0 {
                let cornerRawValue = UIRectCorner.topLeft.rawValue | UIRectCorner.topRight.rawValue
                corner = UIRectCorner(rawValue: cornerRawValue)
            } else {
                let cornerRawValue = UIRectCorner.bottomLeft.rawValue | UIRectCorner.bottomRight.rawValue
                corner = UIRectCorner(rawValue: cornerRawValue)
            }
            let cornerLayer = CAShapeLayer()
            cornerLayer.masksToBounds = true
            cornerLayer.frame = self.bounds
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
            cornerLayer.path = path.cgPath
            self.layer.mask = cornerLayer
        } else {
            self.layer.mask = nil
        }
    }
}


