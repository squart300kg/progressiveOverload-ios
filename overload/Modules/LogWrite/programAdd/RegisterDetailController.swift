//
//  RegisterDetailController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/17.
//

import Foundation
import UIKit
import SQLite3

extension RegisterDetailController {
     
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
        
        registerBtn.rx.tap().bind {
            if self.isInputPerfect == true {
                let table = ExerciseTypeTable()
                table.name = self.exerciseNameField.text!
                table.weight = Double(self.weightFiled.text!)!
                table.repitition = Int32(self.repField.text!)!
                table.setNum = Int32(self.setField.text!)!
                table.restTime = Int32(self.restField.text!)!
                table.rpe = Int32(self.rirField.text!)!
                table.programNo = Int32(exactly: self.viewModel.programNo)!
                table.mesoCycleSplitIndex = Int32(self.viewModel.mesoCycleSplitIndex)
                table.microCycleSplitIndex = Int32(self.viewModel.microCycleSplitIndex)
                
                print("name : \(self.exerciseNameField.text!), weight : \(Double(self.weightFiled.text!)!), programNo: \(Int32(exactly: self.viewModel.programNo)!), meso : \(Int32(self.viewModel.mesoCycleSplitIndex)), micro : \(Int32(self.viewModel.microCycleSplitIndex))")
                ProgramDB.shared.insertExerciseType(table: table)
                self.navigationController?.popViewController(animated: true)
            } else {
                self.showToast(message: "입력창을 모두 채워주세요!")
            }
            
        }.disposed(by: rx.disposeBag)

        exerciseNameField.addTarget(self, action: #selector(isInputPerfect(_:)), for: .editingChanged)
        weightFiled.addTarget(self, action: #selector(isInputPerfect(_:)), for: .editingChanged)
        repField.addTarget(self, action: #selector(isInputPerfect(_:)), for: .editingChanged)
        setField.addTarget(self, action: #selector(isInputPerfect(_:)), for: .editingChanged)
        restField.addTarget(self, action: #selector(isInputPerfect(_:)), for: .editingChanged)
        rirField.addTarget(self, action: #selector(isInputPerfect(_:)), for: .editingChanged)
    } 
}

extension RegisterDetailController {
    // 스크롤 뷰 터치 시 키보드 내리기
    @objc func scrollTap(sender: UITapGestureRecognizer) {
            self.view.endEditing(true)
    }
    
    @objc func isInputPerfect(_ textField: UITextField) {
        if !self.exerciseNameField.text.isNilOrEmpty &&
           !self.weightFiled.text.isNilOrEmpty &&
           !self.repField.text.isNilOrEmpty &&
           !self.setField.text.isNilOrEmpty &&
           !self.restField.text.isNilOrEmpty &&
           !self.rirField.text.isNilOrEmpty {
            activateRegisterBtn()
            isInputPerfect = true
        } else {
            unactivateRegisterBtn()
            isInputPerfect = false
        }
    }
    
    func activateRegisterBtn() {
        registerBtn.backgroundColor = MainColor().green_first
        registerBtn.textColor = MainColor().white
    }
     
    func unactivateRegisterBtn() {
        registerBtn.backgroundColor = .lightGray
        registerBtn.textColor = MainColor().white
    }
    
    func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14.0)) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 10.0, delay: 0.1, options: .curveEaseOut, animations: { toastLabel.alpha = 0.0 }, completion: {(isCompleted) in toastLabel.removeFromSuperview() })
        
    }
}
extension RegisterDetailController {
    
    
}
