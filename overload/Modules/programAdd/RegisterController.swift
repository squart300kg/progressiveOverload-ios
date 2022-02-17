//
//  RegExerciseController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/17.
//

import Foundation
import UIKit
import HMSegmentedControl

class RegisterController: UIViewController {
    
    var navigator: Navigator!
    var viewModel: CycleSelectionViewModel!
    
    var mesoTitle = Array<String>()
    var microTitle = Array<String>()
    
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
    
    lazy var addBorderView: UIView = {
        let view = UIView()
        self.view.addSubview(view)
//        view.snp.makeConstraints{ make in
//            make.top.equalTo(microSegment.snp.bottom)
//            make.leading.trailing.equalToSuperview().inset(10)
//            make.height.equalTo(view.snp.width).multipliedBy(0.5)
//        }
         
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            view.addDashedBorder()
        }

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        bindViewModel()
    }
    
    private func makeUI() {
        tabBarVC?.tabBar.isHidden = true
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
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
    
    private func calculateCycle() {
        for i in 0...viewModel.mesoSplitCount {
            mesoTitle.append("\(i+1)주차")
            print("meso : \(i)주차")
        }
        for i in 0...viewModel.microSplitCount {
            microTitle.append("\(i+1)일")
            print("micro : \(i)일")
        }
    }
}
