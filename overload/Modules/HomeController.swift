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
    
    lazy var mainWebView: WKWebView = {
        let webView = WKWebView()
        self.view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        return webView
    }()
    
    lazy var indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        self.view.addSubview(indicatorView)
        indicatorView.snp.makeConstraints{ (make) in
            make.center.equalToSuperview()
        }
        return indicatorView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeViewModel().sendAppStartEvent()
        
        loadWebView()
        
    }
    
    private func loadWebView() {
        mainWebView.navigationDelegate = self
        mainWebView.allowsBackForwardNavigationGestures = true
        
        mainWebView.load(URLRequest(url: URL(string: "https://pudufu.co.kr/")!))
    }
}

extension HomeController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        indicatorView.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicatorView.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("에러")
    }
}
