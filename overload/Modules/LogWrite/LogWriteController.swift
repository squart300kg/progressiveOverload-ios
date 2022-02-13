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
    
    lazy var addStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var addBorderView: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.snp.makeConstraints{ make in
            make.top.equalTo(UIApplication.shared.statusBarFrame.height)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(view.snp.width).multipliedBy(0.5)
        }
         
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Your code with delay
            view.addDashedBorder()
        }
        return view
    }()
    
    lazy var plusImage: UIImageView = {
        return UIImageView(image: R.image.icon_tabbar_selected_write())
    }()
    
    lazy var addText: UILabel = {
        let label = UILabel()
        label.text = "프로그램 등록"
        label.textAlignment = .center
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
       
        addStackView.insertArrangedSubview(plusImage, at: 0)
        addStackView.insertArrangedSubview(addText, at: 1)
        
        addBorderView.addSubview(addStackView)
        addStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        plusImage.snp.makeConstraints{ make in
            make.leading.trailing.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        addText.snp.makeConstraints { make in
            make.top.equalTo(plusImage.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
//        addBorderView.addSubview(addText)
//        addText.snp.makeConstraints { make in
//            make.leading.trailing.top.equalToSuperview()
//            make.centerY.equalTo(addBorderView)
//        }
        
     
    }
}
