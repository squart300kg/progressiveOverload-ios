//
//  MesoCycleSelectionController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/14.
//

import UIKit

extension MesoCycleSelectionController {
    
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

extension MesoCycleSelectionController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.contentView.layer.masksToBounds = true
        
        // 스크롤 버벅일때 주석 풀어볼 것
//        let radius = cell.contentView.layer.cornerRadius
//        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
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
}
