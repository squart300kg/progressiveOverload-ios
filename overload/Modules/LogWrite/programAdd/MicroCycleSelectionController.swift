//
//  MesoCycleSelectionController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/14.
//

import UIKit

extension MicroCycleSelectionController {
     
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
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 200
        self.tableView.separatorColor = .white
        self.tableView.register(CycleSelectionCell.self, forCellReuseIdentifier: CycleSelectionCell.identifier)
        
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
        
        viewModel.programNo = ProgramDB.shared.insertProgram(program: programTable)
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
