//
//  RegExerciseController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/17.
//

import Foundation
import UIKit
import HMSegmentedControl

extension RegisterController {
     
    override func viewDidLoad() {
        super.viewDidLoad()
         
        makeUI()
        bindViewModel() 
    }
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewWillBackground = false
        
        initPerformedExercises()
        
        changeRegBtnColor()
        
         
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        viewWillBackground = true
    }
    
    private func makeUI() {
        tabBarVC?.tabBar.isHidden = true
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.delegate = self
         
        self.view.addSubview(guideImage)
        self.view.addSubview(mesoSegment)
        self.view.addSubview(microSegment)
        self.view.addSubview(tableView)
        self.view.addSubview(registerBtn)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 200
        self.tableView.separatorColor = .white
        self.tableView.register(ExerciseTypeCell.self, forCellReuseIdentifier: ExerciseTypeCell.identifier)
        self.tableView.register(AddBortionCell.self, forCellReuseIdentifier: AddBortionCell.identifier)
        
        mesoSegment.selectionIndicatorHeight = 0
        mesoSegment.titleTextAttributes = [NSAttributedString.Key.foregroundColor: MainColor().black!]
        mesoSegment.selectedTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: MainColor().green_first]
        mesoSegment.addTarget(self, action:#selector(mesoSegmentChanged(_:)), for: .valueChanged)
        
        microSegment.selectionIndicatorHeight = 0
        microSegment.titleTextAttributes = [NSAttributedString.Key.foregroundColor: MainColor().black!]
        microSegment.selectedTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: MainColor().green_first]
        microSegment.addTarget(self, action:#selector(microSegmentChanged(_:)), for: .valueChanged)
        
        guideImage.snp.makeConstraints { make in
            make.top.equalTo(UIApplication.shared.statusBarFrame.height)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.snp.width).multipliedBy(0.5)
        }
        
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
    
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(microSegment.snp.bottom)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        registerBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    private func bindViewModel() {
        
        registerBtn.rx.tap().bind {
            print("registerBtn click")
        }.disposed(by: rx.disposeBag)
    }
    
    func initPerformedExercises() {
        exerciseList = ProgramDB.shared.getExercises(
            programNo: self.viewModel.programNo,
            mesoIndex: Int(mesoSegment.selectedSegmentIndex),
            microIndex: Int(microSegment.selectedSegmentIndex)
        )
         
        tableView.reloadData()
    }
    
    @objc func mesoSegmentChanged(_ sender: HMSegmentedControl) {
        mesoCycleSplitIndex = Int(sender.selectedSegmentIndex)
        
        initPerformedExercises()
         
    }
    
    @objc func microSegmentChanged(_ sender: HMSegmentedControl) {
        microCycleSplitIndex = Int(sender.selectedSegmentIndex)
        
        initPerformedExercises()
    }
    
    private func changeRegBtnColor() {
        if exerciseList.count > 0 {
            registerBtn.backgroundColor = MainColor().green_first
        } else {
            registerBtn.backgroundColor = .lightGray
        }
    }
}

extension RegisterController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let coordinator = navigationController.topViewController?.transitionCoordinator {
            coordinator.notifyWhenInteractionChanges({ (context) in
                switch context.isCancelled {
                case true: print("")
                case false:
                    if self.viewWillBackground {
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

extension RegisterController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print("click for \(indexPath.row)")
        if indexPath.row == 0 {
            let viewModel = RegisterViewModel()
            viewModel.programNo = self.viewModel.programNo
            viewModel.mesoCycleSplitIndex = Int(self.mesoSegment.selectedSegmentIndex)
            viewModel.microCycleSplitIndex = Int(self.microSegment.selectedSegmentIndex)
            self.navigator.show(segue: .registerDetail(viewModel: viewModel), sender: self)
        } else {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AddBortionCell.identifier, for: indexPath) as! AddBortionCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTypeCell.identifier, for: indexPath) as! ExerciseTypeCell
            
            cell.nameTextView.text = exerciseList[indexPath.row - 1].name
            cell.weightTextView.text = String(exerciseList[indexPath.row - 1].weight)  + "Kg"
            cell.repTextView.text = String(exerciseList[indexPath.row - 1].repitition)
            cell.setNumTextView.text = String(exerciseList[indexPath.row - 1].setNum)

            return cell
        }
    }
}
 
