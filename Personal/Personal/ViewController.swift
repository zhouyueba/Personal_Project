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

class ViewController: UIViewController {
    
    @IBOutlet weak var TestField: UITextField!
    @IBOutlet weak var TestField1: UITextField!
    
    
    @IBOutlet weak var TestBtn: UIButton!
    let fullPlayVC: FullPlayViewController = FullPlayViewController()
    
    var dataSource: Array<Sects> = []
    
    var isLandScape: Bool = false
    
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
            
        let bottomSect = Sects(rows: [EatOrFoodViewModel(), EatOrFoodViewModel(), EatOrFoodViewModel()])
        
        for i in 0..<8 {
            let viewModel = PlanOrAddUnFoldViewModel { index in
                print(i)
                
                let model = bottomSect.rows[index] as? PlanOrAddUnFoldViewModel
                if let model = model {
                    model.isFold = !model.isFold
                    self.tableView.reloadRows(at: [IndexPath(row: index, section: 1)], with: .fade)
                }
            }
            viewModel.isFold = false
            
            bottomSect.rows.append(viewModel)
        }
        
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
        setViewController(isLanscape: true, vc: self)
        
    
        self.view.addSubview(fullPlayVC.view)
        fullPlayVC.view.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
    
    func portraitLayout() {
        
        isLandScape = false
        
        setViewController(canLandscape: false)
        setViewController(isLanscape: false, vc: self)
        fullPlayVC.view.removeFromSuperview()
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
        viewModel.indexPath = indexPath
        
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
        return section == 1 ? view : UIView()
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
            
            landScapeLayout()
        } else {
            
            let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? VideoCell
            
            if let cell = cell {
                if indexPath.row == 1 {
                    let view = OpenCloudView()
                    cell.placeView.addSubview(view)
                    view.snp.makeConstraints { make in
                        make.center.equalTo(cell.placeView)
//                        make.size.equalTo(CGSize(width: 200, height: 90))
                    }
                    
                }
                
                if indexPath.row == 2 {
                    
                }
            }
        
            
         
        }
    }
}

