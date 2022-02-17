//
//  MesoCycleSelectionController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/14.
//

import UIKit

class MesoCycleSelectionController: UIViewController
                                        ,UITableViewDataSource, UITableViewDelegate
{
    var navigator: Navigator!
//    var viewModel: CycleSelectionViewModel!
    
    init(navigator: Navigator) {
        self.navigator = navigator
//        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }
    
    let mesoList: [String] = ["1주",
                              "2주",
                              "3주",
                              "4주",
                              "5주",
                              "6주",
                              "7주",
                              "8주",
                              "9주",
                              "10주",
                              "11주",
                              "12주",
                              "13주",
                              "14주",
                              "15주",
                              "16주",
                              "17주",
                              "18주",
                              "19주",
                              "20주"]
    
    // 선택 해제 설정
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let viewModel = CycleSelectionViewModel()
        viewModel.mesoSplitCount = indexPath.row
        self.navigator.show(segue: .microSelection(viewModel: viewModel), sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CycleSelectionCell.identifier, for: indexPath) as! CycleSelectionCell
        cell.textLabel?.text = mesoList[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .white
        
        cell.contentView.backgroundColor = MainColor().green_first
        cell.contentView.cornerRadius = 10
        cell.backgroundColor = .clear 

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mesoList.count
    }
    
    lazy var tableView: UITableView = {
        return UITableView()
    }()
    
    lazy var guideText: UILabel = {
        let guideTextView = UILabel()
        guideTextView.text = "운동 프로그램을 몇 주차로 설정하실건가요?"
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
        
        circleFirst.backgroundColor = MainColor().green_first
        circleFirst.text = "1"
        circleFirst.cornerRadius = 25
        circleFirst.textColor = .white
        circleFirst.textAlignment = .center
        
        circleSecond.backgroundColor = MainColor().white
        circleSecond.borderColor = MainColor().green_first
        circleSecond.borderWidth = 1
        circleSecond.text = "2"
        circleSecond.cornerRadius = 25
        circleSecond.textColor = MainColor().green_first
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
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    private func makeUI() {
        tabBarVC?.tabBar.isHidden = true
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.addSubview(guideImage)
        self.view.addSubview(tableView)
        
        guideImage.snp.makeConstraints { make in
            make.top.equalTo(UIApplication.shared.statusBarFrame.height)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.snp.width).multipliedBy(0.5)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(guideImage.snp.bottom)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 200
        self.tableView.separatorColor = .white
        self.tableView.register(CycleSelectionCell.self, forCellReuseIdentifier: CycleSelectionCell.identifier)
        
    }
}
