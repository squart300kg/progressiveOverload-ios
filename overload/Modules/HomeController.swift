//
//  TabBarController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/10.
//

import UIKit
import WebKit
import SnapKit

class HomeController: ViewController {
    
    lazy var mainWebView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        bindViewModel()
    }
    
    private func makeUI() {
        let url = URL(string: "https://pudufu.co.kr/" )
        let request = URLRequest(url: url!)

        self.view.addSubview(mainWebView)
        mainWebView.load(request)
    }
    
    func bindViewModel() {}
}
