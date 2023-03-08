//
//  FullPlayViewController.swift
//  Personal
//
//  Created by wangbinji on 2023/3/1.
//

import UIKit

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
        
        tableView.register(PlanOrAddFoldCell.self, forCellReuseIdentifier: "PlanOrAddFoldViewModel")
        tableView.register(PlanOrAddUnFoldCell.self, forCellReuseIdentifier: "PlanOrAddUnFoldViewModel")
        
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
    
    @objc func gesture(gesture: UITapGestureRecognizer) {
        
        let point = gesture.location(in: self.placeView)
        if CGRectContainsPoint(self.tableView.frame, point) {
            return
        }
        
        haveShow = !haveShow
        
        if haveShow {
            hideAnimation()
//            hideTableViewAnimation()
        } else {
            showAnimation()
//            showTableViewAnimation()
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
    lazy var placeView: UIButton = {
        let placeView = UIButton()
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
    
    lazy var leftControl: LeftControl = {
        let view = LeftControl()
        return view
    }()
    
    lazy var rightControl: RightControl = {
        let view = RightControl()
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
            make.top.equalTo(self.view.snp_topMargin)
            make.left.equalTo(self.view.snp_leftMargin)
            make.right.equalTo(self.view.snp_rightMargin)
            make.bottom.equalTo(self.view.snp_bottomMargin)
        }
        
//        let imageV = UIImageView(image: UIImage(named: "IMG_4298"))
//        placeView.addSubview(imageV)
//        imageV.snp.makeConstraints { make in
//            make.edges.equalTo(placeView)
//        }
        
        placeView.addSubview(topControlView)
        placeView.addSubview(bottomControlView)
        placeView.addSubview(middleControlView)
        placeView.addSubview(leftControl)
        placeView.addSubview(rightControl)
        
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
        
        leftControl.snp.makeConstraints { make in
            make.left.equalTo(placeView)
            make.top.equalTo(placeView.snp_topMargin).offset(70)
            make.bottom.equalTo(placeView.snp_bottomMargin).offset(-70)
            make.width.equalTo(70)
        }
        
        rightControl.snp.makeConstraints { make in
            make.right.equalTo(placeView)
            make.top.equalTo(placeView.snp_topMargin).offset(70)
            make.bottom.equalTo(placeView.snp_bottomMargin).offset(-70)
            make.width.equalTo(70)
        }
        
        middleControlView.snp.makeConstraints { make in
            make.center.equalTo(placeView)
            make.size.equalTo(CGSize(width: 220, height: 60))
        }
        
        self.leftControl.bindViewModel(viewModel: LeftControlViewModel(qualityStr: "Hello", speedStr: "world")) { type in
            print(type)
            
            if type == .Shot {
//                let view = OpenCloudView()
//                self.placeView.addSubview(view)
//                view.snp.makeConstraints { make in
//                    make.center.equalTo(self.placeView)
//                }
            }
            
            if type == .Record {
                let view = VideoOutDateView()
                self.placeView.addSubview(view)
                view.snp.makeConstraints { make in
                    make.center.equalTo(self.placeView)
                }
            }
        }
        
        let topSect = Sects(rows: [VideoViewModel(), ErrorViewModel(), CardViewModel()])
        
        let bottomSect = Sects(rows: [])
        
        for i in 0..<8 {
            let viewModel = PlanOrAddUnFoldViewModel { type in
                print(i)
                
                let model = bottomSect.rows[i] as? PlanOrAddUnFoldViewModel
                
                if let model = model {
                    model.isFold = !model.isFold
                    self.tableView.reloadRows(at: [IndexPath(row: i, section: 0)], with: .fade)
                }
            }
            viewModel.isFold = false
            bottomSect.rows.append(viewModel)
        }
        
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
        
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tableViewGesture))
//        self.tableView.addGestureRecognizer(gesture)
    }
    
    @objc func tableViewGesture() {
        
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

extension FullPlayViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewModel = self.dataSource[indexPath.section].rows[indexPath.row]
        
        var baseCell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseIdentifier()) as? BaseCell
        if baseCell == nil {
            baseCell = UITableViewCell(style: .default, reuseIdentifier: viewModel.reuseIdentifier()) as? BaseCell
        }
        baseCell?.bindViewModel(viewModel)
        
        return baseCell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 1 ? "今日吃播" : ""
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = TapBarView()
        view.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)
        return section == 0 ? view : UIView()
    }
    
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

