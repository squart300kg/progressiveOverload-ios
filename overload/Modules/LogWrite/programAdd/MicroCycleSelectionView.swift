//
//  MicroCycleSelectionView.swift
//  overload
//
//  Created by SangYun Song on 2022/02/20.
//

import Foundation
import UIKit

class MicroCycleSelectionController: UIViewController {
    var navigator: Navigator!
    var viewModel: CycleSelectionViewModel!
    
    let mesoList: [String] = ["1일",
                              "2일",
                              "3일",
                              "4일",
                              "5일",
                              "6일",
                              "7일"]
    
    init(viewModel: CycleSelectionViewModel, navigator: Navigator) {
        self.navigator = navigator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }
    
    lazy var tableView: UITableView = {
        return UITableView()
    }()
    
    lazy var guideText: UILabel = {
        let guideTextView = UILabel()
        guideTextView.text = "운동을 일주일에 몇번 하실건가요?"
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
        
        circleSecond.backgroundColor = MainColor().green_first
        circleSecond.borderWidth = 1
        circleSecond.text = "2"
        circleSecond.cornerRadius = 25
        circleSecond.textColor = MainColor().white
        circleSecond.textAlignment = .center
         
        circleThird.backgroundColor = MainColor().white
        circleThird.borderColor = MainColor().green_first
        circleThird.borderWidth = 1
        circleThird.text = "3"
        circleThird.cornerRadius = 25
        circleThird.textColor = MainColor().green_first
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
}
