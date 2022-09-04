//
//  TabBarController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/10.
//

import UIKit
import WebKit
import SnapKit

class HomeController: UIViewController {
    
    lazy var contentView: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        return view
    }()
    
    lazy var contentWebView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    let request = URLRequest(url: URL(string: "https://www.naver.com/")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        print("homeC", "홈컨트롤러 로드")
        makeUI()
        bindViewModel()
    }
    
    private func makeUI() {
        contentView.addSubview(contentWebView)
        contentWebView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
//        contentWebView.text = "hello"
        contentWebView.load(request)
    }
    
    func bindViewModel() {}
}
