//
//  RegisterView.swift
//  overload
//
//  Created by SangYun Song on 2022/02/20.
//

import UIKit
import HMSegmentedControl

class RegisterController: UIViewController {
    
    var navigator: Navigator!
    var viewModel: CycleSelectionViewModel!
    
    var mesoTitle = Array<String>()
    var microTitle = Array<String>()
    
    var mesoCycleSplitIndex = 0
    var microCycleSplitIndex = 0
     
    var viewWillBackground = false
    
    var exerciseList = Array<ExerciseTypeTable>()
    
    init(viewModel: CycleSelectionViewModel, navigator: Navigator) {
        self.navigator = navigator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        calculateCycle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }
    
    lazy var guideText: UILabel = {
        let guideTextView = UILabel()
        guideTextView.text = "이제 운동을 등록하면 끝입니다!"
        guideTextView.textAlignment = .center
        guideTextView.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        
        return guideTextView
    }()
    
    lazy var guideImage: UIView = {
        let resultView = UIView()
        
        let circleFirst = UILabel()
        let circleSecond = UILabel()
        let circleThird = UILabel()
        
        let horiLineFirst = UILabel()
        let horiLineSecond = UILabel()
        
        circleFirst.backgroundColor = MainColor().white
        circleFirst.borderColor = MainColor().green_first
        circleFirst.borderWidth = 1
        circleFirst.text = "1"
        circleFirst.cornerRadius = 25
        circleFirst.textColor = MainColor().green_first
        circleFirst.textAlignment = .center
        
        circleSecond.backgroundColor = MainColor().white
        circleSecond.borderColor = MainColor().green_first
        circleSecond.borderWidth = 1
        circleSecond.text = "2"
        circleSecond.cornerRadius = 25
        circleSecond.textColor = MainColor().green_first
        circleSecond.textAlignment = .center
         
        circleThird.backgroundColor = MainColor().green_first
        circleThird.text = "3"
        circleThird.cornerRadius = 25
        circleThird.textColor = MainColor().white
        circleThird.textAlignment = .center
         
        horiLineFirst.backgroundColor = MainColor().green_first
        
        horiLineSecond.backgroundColor = MainColor().green_first
        
        resultView.addSubview(circleFirst)
        resultView.addSubview(circleSecond)
        resultView.addSubview(circleThird)
        resultView.addSubview(horiLineFirst)
        resultView.addSubview(horiLineSecond)
        resultView.addSubview(guideText)
         
        circleFirst.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.top.leading.equalToSuperview().inset(50)
        }
        
        circleSecond.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.top.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        circleThird.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.trailing.top.equalToSuperview().inset(50)
        }
        
        horiLineFirst.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.centerY.equalTo(circleFirst.snp.centerY)
            make.leading.equalTo(circleFirst.snp.trailing)
            make.trailing.equalTo(circleSecond.snp.leading)
        }
        
        horiLineSecond.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.centerY.equalTo(circleFirst.snp.centerY)
            make.leading.equalTo(circleSecond.snp.trailing)
            make.trailing.equalTo(circleThird.snp.leading)
        }
         
        guideText.snp.makeConstraints { make in
            make.top.equalTo(circleFirst.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
        }
        
        return resultView
    }()
    
    lazy var mesoSegment: HMSegmentedControl = {
        let titles = mesoTitle
        let view = HMSegmentedControl(sectionTitles: titles)
        view.selectedSegmentIndex = 0
        view.backgroundColor = .clear
        view.selectionIndicatorColor = MainColor().green_first!
        
        return view
    }()
    
    lazy var microSegment: HMSegmentedControl = {
        let titles = microTitle
        let view = HMSegmentedControl(sectionTitles: titles)
        view.selectedSegmentIndex = 0
        view.backgroundColor = .clear
        view.selectionIndicatorColor = MainColor().green_first!
        
        return view
    }()
  
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
        
    }()
    
    lazy var registerBtn: UILabel = {
        let label = UILabel()
        label.text = "등록 완료"
        label.textColor = .white
        label.textAlignment = .center
        label.cornerRadius = 10
        label.backgroundColor = .lightGray
        return label
    }()
    
    private func calculateCycle() {
        for i in 0...viewModel.mesoSplitCount {
            mesoTitle.append("\(i+1)주차")
        }
        for i in 0...viewModel.microSplitCount {
            microTitle.append("\(i+1)일")
        }
    }
}

