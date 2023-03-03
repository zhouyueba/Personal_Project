//
//  FullPlayViewController.swift
//  Personal
//
//  Created by wangbinji on 2023/3/1.
//

import UIKit

class TopControl: UIView {
    
    let gradientLayer = CAGradientLayer()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gradientLayer.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor]
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
        button.setImage(UIImage(systemName: "arrowtriangle.left.fill"), for: .normal)
        button.addTarget(self, action: #selector(self.pressLeftBtn), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.isSelected = false
        return button
    }()
    
    lazy var middleBtn: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("Play", for: .normal)
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.addTarget(self, action: #selector(self.pressMiddleBtn), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.isSelected = false
        return button
    }()
    
    lazy var rightBtn: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("Right", for: .normal)
        button.setImage(UIImage(systemName: "arrowtriangle.right.fill"), for: .normal)
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

class FullPlayViewController: UIViewController {
    
    var backBlock: ((Int)->Void)?
    
    
    func backBlockFunc(backBlock: @escaping (Int)->Void) {
        self.backBlock = backBlock
    }
    
    var dataSource: Array<Sects> = []
    
    var timer: DispatchSourceTimer?
    
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
    
    var haveShow = true
    
    
    @objc func pressBtn(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if self.backBlock != nil {
            self.backBlock!(5)
        }

    }
    
    @objc func gesture() {
        
        haveShow = !haveShow
        
        if haveShow {
            hideAnimation()
            hideTableViewAnimation()
        } else {
            showAnimation()
            showTableViewAnimation()
        }
       
    }
    
    func startTimer() {
        
        if self.timer != nil {
            self.timer?.cancel()
            self.timer = nil
        }
        
        var timeCount = 5
        timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        
        guard let timer = timer else { return }
        
        timer.schedule(deadline: .now(), repeating: .seconds(1))
        timer.setEventHandler(handler: {
            
            timeCount = timeCount - 1
            if timeCount <= 0 {
                timer.cancel()
                DispatchQueue.main.async {
                    print("----hello word")
                    self.showAnimation()
                    self.middleControlView.isHidden = true
                }
            }
            
        })
        timer.resume()
    }
    
    // 视频播放View
    lazy var placeView: UIView = {
        let placeView = UIView()
        placeView.backgroundColor = .black
        placeView.layer.borderWidth = 1
        placeView.layer.borderColor = UIColor.black.cgColor
        placeView.clipsToBounds = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.gesture))
        placeView.addGestureRecognizer(gesture)
        
        return placeView
    }()
    
    lazy var topControlView: TopControl = {
        let view = TopControl()
        return view
    }()
    
    lazy var bottomControlView: BottomControl = {
        let view = BottomControl()
        return view
    }()
    
    lazy var middleControlView: MiddleControl = {
        let view = MiddleControl()
        return view
    }()
    
    
    
    lazy var fullBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("< 返回", for: .normal)
        button.addTarget(self, action: #selector(self.pressBtn), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.isSelected = false
        return button
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 20)
        label.textAlignment = .center
        label.textColor = .green
        label.numberOfLines = 0
        label.backgroundColor = .red
        return label
    }()
    
    lazy var testView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .black
        
        
        
        self.view.addSubview(placeView)
        placeView.snp.makeConstraints { make in
//            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
            make.top.equalTo(self.view.snp_topMargin)
            make.left.equalTo(self.view.snp_leftMargin)
            make.right.equalTo(self.view.snp_rightMargin)
            make.bottom.equalTo(self.view.snp_bottomMargin)
        }
        
        
        let imageV = UIImageView(image: UIImage(named: "IMG_4298"))
        placeView.addSubview(imageV)
        imageV.snp.makeConstraints { make in
            make.edges.equalTo(placeView)
        }
        
        placeView.addSubview(topControlView)
        placeView.addSubview(bottomControlView)
        placeView.addSubview(middleControlView)
        
        topControlView.snp.makeConstraints { make in
            make.top.equalTo(placeView)
            make.centerX.equalTo(placeView)
            make.width.equalTo(placeView)
            make.height.equalTo(70)
        }
        
        bottomControlView.snp.makeConstraints { make in
            make.bottom.equalTo(placeView)
            make.centerX.equalTo(placeView)
            make.width.equalTo(placeView)
            make.height.equalTo(70)
        }
        
        middleControlView.snp.makeConstraints { make in
            make.center.equalTo(placeView)
            make.size.equalTo(CGSize(width: 220, height: 60))
        }
        
        let topSect = Sects(rows: [VideoViewModel(), ErrorViewModel(), CardViewModel()])
        
        let bottomSect = Sects(rows: [EatOrFoodViewModel(), EatOrFoodViewModel(), EatOrFoodViewModel(), EatOrFoodViewModel(), EatOrFoodViewModel(), EatOrFoodViewModel(), EatOrFoodViewModel(), EatOrFoodViewModel()])
        
//        self.dataSource.append(topSect)
        self.dataSource.append(bottomSect)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.showsVerticalScrollIndicator = false
        
        placeView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.right.equalTo(placeView).offset(300)
            make.top.equalTo(placeView)
            make.bottom.equalTo(placeView)
            make.width.equalTo(300)
        }
        
        self.placeView.addSubview(self.fullBtn)
        self.fullBtn.snp.makeConstraints { make in
            make.top.equalTo(self.placeView).offset(16)
            make.left.equalTo(self.placeView).offset(16)
        }
        
//        NotificationCenter.default.addObserver(self, selector: #selector(appBecomeActive), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        startTimer()
    }
    
    
    func showTableViewAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.tableView.snp.updateConstraints { make in
                make.right.equalTo(self.placeView).offset(0)
            }
            self.placeView.layoutIfNeeded()
        }
    }
    
    func hideTableViewAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.tableView.snp.updateConstraints { make in
                make.right.equalTo(self.placeView).offset(300)
            }
            self.placeView.layoutIfNeeded()
        }
    }
    
    func showAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.topControlView.snp.updateConstraints { make in
                make.top.equalTo(self.placeView).offset(-100)
            }
            self.bottomControlView.snp.updateConstraints { make in
                make.bottom.equalTo(self.placeView).offset(100)
            }
            self.placeView.layoutIfNeeded()
        }
    }
    
    func hideAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.topControlView.snp.updateConstraints { make in
                make.top.equalTo(self.placeView).offset(0)
            }
            self.bottomControlView.snp.updateConstraints { make in
                make.bottom.equalTo(self.placeView).offset(0)
            }
            self.placeView.layoutIfNeeded()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if size.width > size.height {
            print("这是横屏1")
//            landScapeLayout()
            
        } else {
            print("这是竖屏1")
            
//            portraitLayout()
        }
    }
}

extension FullPlayViewController {

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




extension FullPlayViewController: UITableViewDelegate, UITableViewDataSource {
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
            
            let vc = FullPlayViewController()
            vc.modalPresentationStyle = .overFullScreen
            
            let nav = UINavigationController(rootViewController: FullPlayViewController())
            nav.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: false)
        }
    }
}

