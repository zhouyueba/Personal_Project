//
//  FullPlayViewController.swift
//  Personal
//
//  Created by wangbinji on 2023/3/1.
//

import UIKit

class FullPlayViewController: UIViewController {
    
    @objc func pressBtn(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        setViewController(isLanscape: sender.isSelected)
    }
    
    lazy var fullBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("全屏", for: .normal)
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
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(fullBtn)
        fullBtn.snp.makeConstraints { make in
            make.center.equalTo(self.view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setViewController(canLandscape: true)
        setViewController(isLanscape: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setViewController(canLandscape: false)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if size.width > size.height {
            print("这是横屏")
        } else {
            print("这是竖屏")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setViewController(canLandscape: false)
        self.dismiss(animated: true)
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
                windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscape))
            } else {
                // Fallback on earlier versions
                UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
            }
        } else {
            if #available(iOS 16.0, *) {
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
            } else {
                // Fallback on earlier versions
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            }
        }
    }
}
