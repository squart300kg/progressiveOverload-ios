//
//  RegExerciseController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/17.
//

import Foundation
import UIKit

extension RegisterController {
     
    override func viewDidLoad() {
        super.viewDidLoad()
         
        makeUI()
        bindViewModel()
        navigationController?.interactivePopGestureRecognizer?.addTarget(self, action: #selector(handleBackswipe))
    }
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        willBackground = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        willBackground = true
    }
    
    private func makeUI() {
        tabBarVC?.tabBar.isHidden = true
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.delegate = self
        
        
        
        self.view.addSubview(guideImage)
//        self.view.addSubview(tableView)
        
        guideImage.snp.makeConstraints { make in
            make.top.equalTo(UIApplication.shared.statusBarFrame.height)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.snp.width).multipliedBy(0.5)
        }
        
        self.view.addSubview(mesoSegment)
        self.view.addSubview(microSegment)
        self.view.addSubview(addBorderView)
        addBorderView.addSubview(plusImage)
        addBorderView.addSubview(addText)
        self.view.addSubview(registerBtn)
         
        mesoSegment.snp.makeConstraints { make in
            make.top.equalTo(guideImage.snp.bottom)
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
        
        microSegment.snp.makeConstraints { make in
            make.top.equalTo(mesoSegment.snp.bottom)
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
        
        addBorderView.snp.makeConstraints { make in
            make.top.equalTo(microSegment.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(view.snp.width).multipliedBy(0.5)
        }
        
        plusImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(75)
            make.centerX.equalToSuperview()
        }
        addText.snp.makeConstraints { make in
            make.top.equalTo(plusImage.snp.bottom)
            make.centerX.equalToSuperview()
        }
        registerBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(10)
        }
//        tableView.snp.makeConstraints { make in
//            make.top.equalTo(guideImage.snp.bottom)
//            make.bottom.equalToSuperview()
//            make.leading.trailing.equalToSuperview()
//        }
        
//        self.tableView.dataSource = self
//        self.tableView.delegate = self
//        self.tableView.rowHeight = 200
//        self.tableView.separatorColor = .white
//        self.tableView.register(CycleSelectionCell.self, forCellReuseIdentifier: CycleSelectionCell.identifier)
        
    }
    
    private func bindViewModel() {
        addBorderView.rx.tap().bind {
            self.navigator.show(segue: .registerDetail, sender: self)
        }.disposed(by: rx.disposeBag)
    }
    
//    func swipeRecognizer() {
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
//        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
//        self.view.addGestureRecognizer(swipeRight)
//
//    }
//
//    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
//        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
//            switch swipeGesture.direction{
//            case UISwipeGestureRecognizer.Direction.right:
//                // 스와이프 시, 원하는 기능 구현.
//                print("뒤로가깅")
//                self.dismiss(animated: true, completion: nil)
//            default: break
//            }
//        }
//    }
    
    
    @objc private func handleBackswipe() {
//        print("뒤로가깅깅")
        navigationController?.interactivePopGestureRecognizer?.removeTarget(self, action: #selector(self.handleBackswipe))
        // insert your custom code here
    }
     
    
}

extension RegisterController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let coordinator = navigationController.topViewController?.transitionCoordinator {
            coordinator.notifyWhenInteractionChanges({ (context) in
                switch context.isCancelled {
                case true: print("")
                case false:
                    if self.willBackground {
                        let alert = UIAlertController(title: "운동 프로그램을 저장할까요?", message: "", preferredStyle: UIAlertController.Style.alert)
                        let saveAction = UIAlertAction(title: "저장", style: .default) { _ in
                            // Nothing To Do...
                        }
                        let noSaveAction = UIAlertAction(title: "저장안함", style: .destructive) { _ in
                            ProgramDB.shared.deleteProgram(programNo: self.viewModel.programNo)
                        }
                        alert.addAction(noSaveAction)
                        alert.addAction(saveAction)
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                }
                
            })
        }
    }
}
