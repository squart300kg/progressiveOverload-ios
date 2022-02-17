//
//  RegisterDetailController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/17.
//

import Foundation
import UIKit

class RegisterDetailController: UIViewController {
    
    var navigator: Navigator!
    
    init(navigator: Navigator) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }
    
    lazy var exerciseNameField: UITextField = {
        let textView = UITextField()
        textView.textColor = MainColor().main_orange
        textView.attributedPlaceholder = NSAttributedString(string: "스쿼트")
        return textView
    }()
    
    lazy var exerciseName: UIView = {
        let view = UIView()
        view.backgroundColor = MainColor().light_gray
        view.cornerRadius = 10
        
        let label = UILabel()
        label.text = "운동종목"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(10)
        }

        let textView = exerciseNameField
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview().inset(10)
        }
        return view
    }()
    
    lazy var weightFiled: UITextField = {
        let textView = UITextField()
        textView.textColor = MainColor().main_orange
        textView.attributedPlaceholder = NSAttributedString(string: "80")
        return textView
    }()
    
    lazy var weight: UIView = {
        let view = UIView()
        view.backgroundColor = MainColor().light_gray
        view.cornerRadius = 10
        
        let label = UILabel()
        label.text = "중량(Kg)"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(10)
        }
        
        let textView = weightFiled
        textView.keyboardType = .decimalPad
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview().inset(10)
        }
        return view
    }()
     
    lazy var repField: UITextField = {
        let textView = UITextField()
        textView.textColor = MainColor().main_orange
        textView.attributedPlaceholder = NSAttributedString(string: "12")
        return textView
    }()
    
    lazy var rep: UIView = {
        let view = UIView()
        view.backgroundColor = MainColor().light_gray
        view.cornerRadius = 10
        
        let label = UILabel()
        label.text = "반복수"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(10)
        }
        
        let textView = repField
        textView.keyboardType = .decimalPad
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview().inset(10)
        }
        return view
    }()
    
    lazy var setField: UITextField = {
        let textView = UITextField()
        textView.textColor = MainColor().main_orange
        textView.attributedPlaceholder = NSAttributedString(string: "3")
        return textView
    }()
    
    lazy var setNum: UIView = {
        let view = UIView()
        view.backgroundColor = MainColor().light_gray
        view.cornerRadius = 10
        
        let label = UILabel()
        label.text = "세트수"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(10)
        }
        
        let textView = setField
        textView.keyboardType = .decimalPad
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview().inset(10)
        }
        return view
    }()
    
    lazy var restField: UITextField = {
        let textView = UITextField()
        textView.textColor = MainColor().main_orange
        textView.attributedPlaceholder = NSAttributedString(string: "60")
        return textView
    }()
    
    lazy var rest: UIView = {
        let view = UIView()
        view.backgroundColor = MainColor().light_gray
        view.cornerRadius = 10
        
        let label = UILabel()
        label.text = "휴식시간(초)"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(10)
        }
        
        let textView = restField
        textView.keyboardType = .decimalPad
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview().inset(10)
        }
        return view
    }()
    
    lazy var rirField: UITextField = {
        let textView = UITextField()
        textView.textColor = MainColor().main_orange
        textView.attributedPlaceholder = NSAttributedString(string: "1")
        return textView
    }()
    
    lazy var rir: UIView = {
        let view = UIView()
        view.backgroundColor = MainColor().light_gray
        view.cornerRadius = 10
        
        let label = UILabel()
        label.text = "rir"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(10)
        }
        
        let textView = rirField
        textView.keyboardType = .decimalPad
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview().inset(10)
        }
        return view
    }()
    
    lazy var registerBtn: UILabel = {
        
        let label = UILabel()
        label.text = "등록 하기"
        label.textColor = MainColor().white
        label.textAlignment = .center
        label.cornerRadius = 10
        label.backgroundColor = .lightGray
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        bindViewModel()
    }
    
    private func makeUI() {
        view.backgroundColor = .white
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scrollTap))
        view.addGestureRecognizer(singleTapGestureRecognizer)
        
        view.addSubview(exerciseName)
        view.addSubview(weight)
        view.addSubview(rep)
        view.addSubview(setNum)
        view.addSubview(rest)
        view.addSubview(rir)
        view.addSubview(registerBtn)
        
        exerciseName.snp.makeConstraints { make in
            make.top.equalTo(UIApplication.shared.statusBarFrame.height)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }
        weight.snp.makeConstraints { make in
            make.top.equalTo(exerciseName.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }
        rep.snp.makeConstraints { make in
            make.top.equalTo(weight.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }
        setNum.snp.makeConstraints { make in
            make.top.equalTo(rep.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }
        rest.snp.makeConstraints { make in
            make.top.equalTo(setNum.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }
        rir.snp.makeConstraints { make in
            make.top.equalTo(rest.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }
        registerBtn.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }
    
    private func bindViewModel() {
        exerciseName.rx.tap().bind {
            self.exerciseNameField.becomeFirstResponder()
        }.disposed(by: rx.disposeBag)
        
        weight.rx.tap().bind {
            self.weightFiled.becomeFirstResponder()
        }.disposed(by: rx.disposeBag)
        
        rep.rx.tap().bind {
            self.repField.becomeFirstResponder()
        }.disposed(by: rx.disposeBag)
        
        setNum.rx.tap().bind {
            self.setField.becomeFirstResponder()
        }.disposed(by: rx.disposeBag)
        
        rest.rx.tap().bind {
            self.restField.becomeFirstResponder()
        }.disposed(by: rx.disposeBag)
        
        rir.rx.tap().bind {
            self.rirField.becomeFirstResponder()
        }.disposed(by: rx.disposeBag)

    }
}

extension RegisterDetailController {
    // 스크롤 뷰 터치 시 키보드 내리기
    @objc func scrollTap(sender: UITapGestureRecognizer) {
            self.view.endEditing(true)
    }
}
