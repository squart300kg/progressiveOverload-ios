//
//  MesoCycleSelectionController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/14.
//

import UIKit

class MicroCycleSelectionController: UIViewController {
    var navigator: Navigator!
    var viewModel: CycleSelectionViewModel!
    
    init(viewModel: CycleSelectionViewModel, navigator: Navigator) {
        self.navigator = navigator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }
    
    let mesoList: [String] = ["1일",
                              "2일",
                              "3일",
                              "4일",
                              "5일",
                              "6일",
                              "7일"]

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

extension MicroCycleSelectionController: UITableViewDataSource, UITableViewDelegate {
    
    // 선택 해제 설정
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let viewModel = CycleSelectionViewModel()
        viewModel.microSplitCount = indexPath.row
        viewModel.mesoSplitCount = self.viewModel.mesoSplitCount
        
        let programTable = ProgramTable()
        programTable.name = DateUtils().getCurrentDateForProgramName()
        programTable.mesoSplitText = "\(viewModel.mesoSplitCount + 1)주"
        programTable.mesoSplitCount = Int32(viewModel.mesoSplitCount + 1)
        programTable.microCycleText = "\(viewModel.microSplitCount + 1)일"
        programTable.microCycleCount = Int32(viewModel.microSplitCount + 1)
        programTable.isDummy = false
        programTable.isDummyDataInit = false
        
        ProgramDB().insertProgram(program: programTable)
        self.navigator.show(segue: .register(viewModel: viewModel), sender: self)
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
}
