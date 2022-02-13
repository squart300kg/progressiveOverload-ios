//
//  LogWriteController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/11.
//

import UIKit
import SnapKit

class LogWriteController: UIViewController {
    var viewModel: ViewModel?
    var navigator: Navigator!
   
    lazy var addBorderView: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.snp.makeConstraints{ make in
            make.top.equalTo(UIApplication.shared.statusBarFrame.height)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(view.snp.width).multipliedBy(0.5)
        }
         
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            view.addDashedBorder()
        }
        
//        view.addTarget(self, action: #selector(self.onClickAddProgram), for: .touchUpInside)
        return view
    }()
    
    lazy var plusImage: UIImageView = {
        let imageView = UIImageView(image: R.image.icon_plus())
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        return imageView
    }()
    
    lazy var addText: UILabel = {
        let label = UILabel()
        label.text = "프로그램 등록"
        label.textAlignment = .center
        label.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
        return label
    }()
     
    init(viewModel: ViewModel?, navigator: Navigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
    }
    
    private func makeUI() {
        self.view.backgroundColor = .white
        
        addBorderView.addSubview(plusImage)
        addBorderView.addSubview(addText)
        
        plusImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(75)
            make.centerX.equalToSuperview()

            
        }
        addText.snp.makeConstraints { make in
            make.top.equalTo(plusImage.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func onClickAddProgram(_ sender: Any) {
        print("플그램추가")
    }
}
