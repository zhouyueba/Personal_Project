//
//  TestViewController.swift
//  Personal
//
//  Created by wangbinji on 2023/3/1.
//

import UIKit
import WebKit
import RxSwift
import RxCocoa
import SwiftyJSON

@objc enum VideoStyle: Int {
    case Offline = 0
    case OpenCloud
    case OpenCamera
    case OutDate
    case Loading
    case Tips
}

class OpenCloudViewModel: BaseViewModel {
    
    @objc dynamic var topText: String!
    @objc dynamic var bottomText: String!
    
    init(topText: String!, bottomText: String!) {
        self.topText = topText
        self.bottomText = bottomText
    }
    
    func openCloud() {
        
        self.topText = "open Cloud"
        print("open Cloud")
        
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true)
    }
}

class VideoOutDateViewModel: BaseViewModel {
    
    var topText: String!
    var bottomText: String!
    
    init(topText: String!, bottomText: String!) {
        self.topText = topText
        self.bottomText = bottomText
    }
    
    func learnMore() {
        print("learn more")
        
        let view = WKWebView(frame: CGRect(x: 0, y: 0, width: 300, height: 200), configuration: WKWebViewConfiguration())
        view.load(URLRequest(url: URL(string: "https://www.baidu.com")!))
        
        let vc = UIViewController()
        vc.view.addSubview(view)
        UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true)
        
    }
    
}

class OpenCameraViewModel: BaseViewModel {
    
}

class OfflineViewModel: BaseViewModel {
    
}

class VideoLoadingViewModel: BaseViewModel {
    
}

class VideoTipsViewModel: BaseViewModel {
    
}



protocol StatusViewProrocol {
    
    func bind(viewModel: BaseViewModel)
}

class TestViewController: UIViewController {
    var dispose: DisposeBag = DisposeBag()
    
    @objc dynamic var videoStyle: VideoStyle = .Loading
    
    @objc dynamic let openCloudVM = OpenCloudViewModel(topText: "开通云服务，查看完整视频", bottomText: "立即开通")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .green
        
        let openCloudView = OpenCloudView()
        openCloudView.bind(viewModel: openCloudVM)
        
        self.view.addSubview(openCloudView)
        openCloudView.snp.makeConstraints { make in
            make.center.equalTo(self.view)
        }
        
        self.rx.observeWeakly(String.self, "openCloudVM.topText").subscribe { str in
            openCloudView.topTextL.text = str
        }.disposed(by: dispose)
        
        openCloudView.bottomBtn.rx.tap.subscribe { event in
            print("123456")
        }
        
        self.rx.observeWeakly(VideoStyle.self, "videoStyle").subscribe { style in
            print(style)
        }.disposed(by: dispose)
        
        
        let path = Bundle.main.path(forResource: "d4sh", ofType: "json")
        
//        let url = URL(fileURLWithPath: path)
        
        if let path = path {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                let jsonStr = String(data: data, encoding: .utf8)
                
                if let json = try? JSON(data: data) {
                    let deviceDetail = D4sh_model(json: json)
                    print(jsonStr)
                    
                }
                
            }
            
        }
        
        
        
        
//        let outDateVM = VideoOutDateViewModel(topText: "视频已过期", bottomText: "了解更多")
//        let outDateView = VideoOutDateView()
//        outDateView.bind(viewModel: outDateVM)
//
//        self.addObserver(outDateVM, forKeyPath: "", context: nil)
//
//        self.view.addSubview(outDateView)
//        outDateView.snp.makeConstraints { make in
//            make.top.equalTo(openCloudView.snp.bottom).offset(40)
//            make.centerX.equalTo(self.view)
//        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.openCloudVM.topText = "hello world"
        print("hello world")
    }
    
    
    

}
